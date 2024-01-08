import 'package:flutter/material.dart';
import 'package:quizz/utils/constants.dart';

class QuestionResultIndex extends StatelessWidget {
  const QuestionResultIndex({super.key, required this.data});
  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    bool correct = data['user_answer'] == data['correct_answer'];

    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: correct ? correctColor : incorrectColor,
          borderRadius: BorderRadius.circular(15)),
      child: Text(((data['question_index'] as int) + 1).toString()),
    );
  }
}
