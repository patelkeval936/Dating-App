import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/features/task2/presentation/recording_screen/recorder_cta.dart';
import '../../../../utils/app_strings.dart';
import '../recorder_bloc/recorder_bloc.dart';
import 'action_text_button.dart';

class RecorderActionButtons extends StatelessWidget {
  const RecorderActionButtons({
    super.key,
    required this.state,
  });

  final RecorderState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ActionTextButtons(
                state: state,
                text: AppStrings.delete,
                isRed: false,
                action: () {
                  context.read<RecorderBloc>().add(RecordingDelete());
                }),
            RecorderCTA(state: state,),
            ActionTextButtons(
                state: state,
                text: AppStrings.submit,
                isRed: false,
                action: () {
                  context.read<RecorderBloc>().add(RecordingSubmit());
                }),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 22),
          child: ActionTextButtons(
              state: state,
              text: AppStrings.unmatch,
              isRed: true,
              action: () {
                context.read<RecorderBloc>().add(RecordingSubmit());
              }),
        ),
      ],
    );
  }
}
