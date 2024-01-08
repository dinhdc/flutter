import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz/widgets/answer_button.dart';
import 'package:quizz/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void onTap(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex = currentQuestionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestions = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestions.question,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 201, 153, 251),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestions.getShuffleAnswers().map((item) {
              return AnswerButton(
                  answer: item,
                  onTap: () {
                    onTap(item);
                  });
            })
          ],
        ),
      ),
    );
  }
}
