import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("images/cat.jpg"),
              ),
              Text(
                'Meow Meow',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico"),
              )
            ],
          ),
          // child: Row(
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: [
          //     Container(
          //       color: Colors.red,
          //       width: 100,
          //     ),
          //     Expanded(
          //       child: Container(
          //         color: Colors.teal,
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Container(
          //               height: 100,
          //               width: 100,
          //               color: Colors.yellow,
          //             ),
          //             Container(
          //               height: 100,
          //               width: 100,
          //               color: Colors.green,
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //     Container(
          //       color: Colors.blue,
          //       width: 100,
          //     )
          //   ],
          // ),
          // child: Column(
          //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: <Widget>[
          //     Container(
          //       height: 100,
          //       // width: 100,
          //       // margin: EdgeInsets.only(left: 30),
          //       // padding: EdgeInsets.all(20),
          //       color: Colors.white,
          //       child: Text('Container 1'),
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     Container(
          //       height: 100,
          //       width: 100,
          //       color: Colors.blue,
          //       child: Text('Container 2'),
          //     ),
          //     Container(
          //       height: 100,
          //       width: 100,
          //       color: Colors.red,
          //       child: Text('Container 3'),
          //     ),
          //   ],
          // )
        ),
      ),
    );
  }
}
