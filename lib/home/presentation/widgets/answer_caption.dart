import 'package:flutter/material.dart';
import 'package:stroll_social_assignment/utils/app_styles.dart';

class AnswerCaption extends StatelessWidget {
  const AnswerCaption({super.key, required this.answer});

  final String answer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        answer,
        style: AppStyles.answerCaptionStyle,
      ),
    );
  }
}
