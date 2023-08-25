import 'package:flutter/material.dart';
import 'package:listicle/screens/home_screen.dart';
import 'package:listicle/screens/sign_in_screen.dart';
import 'package:listicle/screens/sign_up_screen.dart';
import 'package:listicle/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listicle',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        "/signUp": (context) => const SignUpScreen(),
        "/signIn": (context) => const SignInScreen(),
        "/home": (context) => const HomeScreen(),
      },
    );
  }
}
