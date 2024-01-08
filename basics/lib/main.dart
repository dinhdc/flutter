import 'package:basics/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      home: Scaffold(
          body: GradientContainer(colors: [
    Color.fromARGB(255, 26, 2, 80),
    Color.fromARGB(255, 45, 7, 98)
  ]))));
}
