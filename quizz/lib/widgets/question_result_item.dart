import 'package:flutter/material.dart';
import 'package:quizz/utils/constants.dart';
import 'package:quizz/widgets/question_result_index.dart';

class QuestionResultItem extends StatelessWidget {
  const QuestionResultItem({super.key, required this.data});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    bool correct = data['user_answer'] == data['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionResultIndex(data: data),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['question'] as String,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  data['user_answer'] as String,
                  style: TextStyle(
                      color: correct ? correctColor : incorrectColor,
                      fontSize: 14),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  data['correct_answer'] as String,
                  style: const TextStyle(color: correctColor, fontSize: 14),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
