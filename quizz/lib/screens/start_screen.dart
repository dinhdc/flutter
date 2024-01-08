import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz,{Key? key}) ;

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          color: const Color.fromARGB(150, 255, 255, 255),
          width: 300,
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          "Learn Flutter the fun way!",
          style: TextStyle(
              color: Color.fromARGB(255, 237, 223, 252), fontSize: 24),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
          onPressed: (){
            startQuiz();
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 237, 223, 252),
          ),
          label: const Text('Start Quiz'),
          icon: Icon(Icons.arrow_right_alt),
        )
      ]),
    );
  }
}
