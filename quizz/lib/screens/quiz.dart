import 'package:flutter/material.dart';
import 'package:quizz/screens/start_screen.dart';
import 'package:quizz/screens/question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  @override
  void initState() {
    activeScreen = 'question-screen';
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 68)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: activeScreen == 'start-screen'
                  ? StartScreen(switchScreen)
                  : const QuestionScreen())),
    );
  }
}
