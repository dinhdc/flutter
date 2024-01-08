import 'package:flutter/material.dart';
import 'package:quizz/data/questions.dart';
import 'package:quizz/widgets/question_summary.dart';
import 'package:quizz/widgets/text_button_icon.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.chosenAnswers,
      required this.restart,
      required this.home});

  final List<String> chosenAnswers;
  final void Function() restart;
  final void Function() home;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData
        .where((element) => element['correct_answer'] == element['user_answer'])
        .length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'You answered $numCorrectQuestion out of $numTotalQuestion questions correctly',
                style: const TextStyle(color: Colors.white, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionSummary(summaryData),
              const SizedBox(
                height: 30,
              ),
              TextButtonIcon(
                  onClick: home, label: 'Home', icon: const Icon(Icons.home)),
              TextButtonIcon(
                  onClick: restart,
                  label: 'Restart Quiz',
                  icon: const Icon(Icons.refresh)),
            ],
          ),
        ));
  }
}
