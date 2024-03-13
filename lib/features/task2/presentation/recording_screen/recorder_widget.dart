import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/features/task2/presentation/recording_screen/recorder_action_buttons.dart';
import 'package:stroll_social_assignment/features/task2/presentation/recording_screen/recorder_progress_text.dart';
import '../recorder_bloc/recorder_bloc.dart';
import 'amplitude_builder.dart';

class RecorderWidget extends StatefulWidget {
  const RecorderWidget({super.key});

  @override
  State<RecorderWidget> createState() => _RecorderWidgetState();
}

class _RecorderWidgetState extends State<RecorderWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecorderBloc, RecorderState>(
      builder: (context, state) {
        return Column(
          children: [
            RecorderProgressText(state: state),
            const AmplitudeBuilder(),
            const SizedBox(height: 40),
            RecorderActionButtons(state: state),
          ],
        );
      },
    );
  }
}
