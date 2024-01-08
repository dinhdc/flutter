import 'package:flutter/material.dart';
import 'package:quizz/widgets/question_result_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return QuestionResultItem(data: data);
          }).toList(),
        ),
      ),
    );
  }
}
