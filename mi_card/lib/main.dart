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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("images/cat.jpg"),
              ),
              const Text(
                'Meow Meow',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico"),
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(
                    fontFamily: 'Source Code Pro',
                    color: Colors.teal.shade100,
                    fontSize: 20,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold),
              ),
              // Container(
              //   color: Colors.white,
              //   padding: EdgeInsets.all(10.0),
              //   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              //   child: Row(
              //     children: [
              //       const Icon(
              //         Icons.phone,
              //         color: Colors.teal,
              //       ),
              //       const SizedBox(
              //         width: 10,
              //       ),
              //       Text(
              //         '+84 965 027 356',
              //         style: TextStyle(
              //             color: Colors.teal.shade900,
              //             fontFamily: 'Source Code Pro',
              //             fontSize: 20.0),
              //       )
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      '+84 965 027 356',
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'Source Code Pro',
                          fontSize: 20.0),
                    )),
              ),
              // Container(
              //   color: Colors.white,
              //   padding: const EdgeInsets.all(10.0),
              //   margin: const EdgeInsets.symmetric(
              //       vertical: 10.0, horizontal: 25.0),
              //   child: Row(
              //     children: [
              //       const Icon(
              //         Icons.email,
              //         color: Colors.teal,
              //       ),
              //       const SizedBox(
              //         width: 10,
              //       ),
              //       Text(
              //         'congdinh.work@gmail.com',
              //         style: TextStyle(
              //             color: Colors.teal.shade900,
              //             fontFamily: 'Source Code Pro',
              //             fontSize: 20.0),
              //       )
              //     ],
              //   ),
              // ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: const Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'congdinh@gmail.com',
                    style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'Source Code Pro',
                        fontSize: 20.0),
                  ),
                ),
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
