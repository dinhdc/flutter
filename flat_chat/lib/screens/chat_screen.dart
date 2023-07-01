import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flat_chat/components/message_bubble.dart';
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
              icon: const Icon(Icons.close),
              onPressed: () {
                // _auth.signOut();
                // Navigator.pop(context);
                messagesStream();
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const MessagesStream(),
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
                    child: const Text(
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
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
                children: messageBubbles,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
        });
  }
}
