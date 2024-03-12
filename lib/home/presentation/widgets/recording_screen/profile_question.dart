import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/home/presentation/bloc/question_bloc/question_bloc.dart';
import 'package:stroll_social_assignment/home/presentation/bloc/question_bloc/question_bloc_state.dart';
import '../answer_caption.dart';

class ProfileQuestion extends StatefulWidget {
  const ProfileQuestion({super.key});

  @override
  State<ProfileQuestion> createState() => _ProfileQuestionState();
}

class _ProfileQuestionState extends State<ProfileQuestion> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<QuestionBloc, QuestionBlocState>(builder: (context, state) {
          if (state is QuestionLoading) {
            return const CircularProgressIndicator();
          }

          if (state is QuestionFailed) {
            return Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            );
          }

          if (state is QuestionSuccess && state.question != null) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: Text(
                    state.question?.question ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                AnswerCaption(answer: state.question?.answer ?? ''),
              ],
            );
          }

          return Container();
        }),
      ],
    );
  }
}
