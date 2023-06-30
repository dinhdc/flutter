import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flat_chat/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

final _fireStore = FirebaseFirestore.instance;
User? loggedInUser;
final CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('messages');

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  String messageText = '';
  final messageTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    // getMessages();
  }

  void getCurrentUser() {
    try {
      User user = _auth.currentUser!;
      loggedInUser = user;
    } catch (e) {
      print(e);
    }
  }

  // void getMessages() {
  //   collectionReference.get().then(
  //       (querySnapshot){
  //         print("Successfully completed");
  //         for (var docSnapshot in querySnapshot.docs) {
  //           print('${docSnapshot.id} => ${docSnapshot.data()}');
  //         }
  //       },
  //       onError: (e) => print("Error completing: $e"),
  //   );
  // }

  void messagesStream() async {
    await for (var snapshot in collectionReference.snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // _auth.signOut();
                // Navigator.pop(context);
                messagesStream();
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        setState(() {
                          messageText = value;
                        });
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      try {
                        await collectionReference.add({
                          "text": messageText,
                          "sender": loggedInUser?.email
                        });
                        messageTextController.clear();
                      } catch (e) {}
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  const MessagesStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: collectionReference.snapshots(),
        builder: (context, snapshot) {
          List<MessageBubble> messageBubbles = [];
          if (snapshot.hasData) {
            final messages = snapshot.data?.docs;
            for (var message in messages!) {
              final res = message.data() as Map<String, dynamic>;
              final messageText = res["text"].toString();
              final messageSender = res["sender"].toString();
              final currentUser = loggedInUser?.email;
              print("curren user: $currentUser");
              print("messaeSender : $messageSender");
              final messageBubble = MessageBubble(
                text: messageText,
                sender: messageSender,
                isMe: currentUser == messageSender,
              );
              messageBubbles.add(messageBubble);
            }
            return Expanded(
              child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
                children: messageBubbles,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
        });
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isMe;

  const MessageBubble(
      {super.key,
      required this.text,
      required this.sender,
      required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            Material(
              borderRadius: isMe ? BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
                // topLeft: BorderRadius.circular(30),
              ): BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
                // topLeft: BorderRadius.circular(30),
              ),
              elevation: 5,
              color: isMe ? Colors.lightBlueAccent : Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: isMe ? Colors.white : Colors.black54),
                ),
              ),
            ),
          ],
        ));
  }
}
