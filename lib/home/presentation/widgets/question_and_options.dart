import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/home/presentation/bloc/option_cubit/option_cubit.dart';
import 'package:stroll_social_assignment/home/presentation/bloc/question_bloc/question_bloc.dart';
import 'package:stroll_social_assignment/home/presentation/bloc/question_bloc/question_bloc_state.dart';
import 'package:stroll_social_assignment/home/presentation/widgets/options.dart';
import 'package:stroll_social_assignment/home/presentation/widgets/profile_header.dart';
import 'answer_caption.dart';

class QuestionAndOptions extends StatefulWidget {
  const QuestionAndOptions({super.key});

  @override
  State<QuestionAndOptions> createState() => _QuestionAndOptionsState();
}

class _QuestionAndOptionsState extends State<QuestionAndOptions> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ProfileHeader(),
        BlocBuilder<QuestionBloc, QuestionBlocState>(builder: (context, state) {

          if (state is QuestionLoading) {
            return const CircularProgressIndicator();
          }

          if (state is QuestionFailed) {
            return Text(state.message,style: const TextStyle(color: Colors.red),);
          }

          if (state is QuestionSuccess && state.question != null) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 78, top: 34),
                  child: Text(
                    state.question?.question ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                AnswerCaption(answer: state.question?.answer ?? ''),
                BlocProvider(
                    create: (BuildContext context) => OptionCubit(),
                    child: Options(optionsList: state.question?.options ?? []))
              ],
            );
          }

          return Container();
        }),
      ],
    );
  }
}
