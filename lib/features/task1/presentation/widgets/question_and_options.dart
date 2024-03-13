import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/features/task1/presentation/widgets/profile_header.dart';
import '../bloc/option_cubit/option_cubit.dart';
import '../bloc/question_bloc/question_bloc.dart';
import '../bloc/question_bloc/question_bloc_state.dart';
import 'answer_caption.dart';
import 'options.dart';

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
