import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/authentication/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tiktok Clone',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: LoginScreen(),
    );
  }
}
