import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: Center(child: Text('HelloWord!')),
//   ));
// }

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Center(child: Text('I Am Rich')),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: const Center(child: Image(image: AssetImage('images/diamond.png'))),
    ),
  ));
}
