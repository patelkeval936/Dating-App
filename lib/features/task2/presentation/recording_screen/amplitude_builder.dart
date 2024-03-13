import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record/record.dart';
import 'package:stroll_social_assignment/core/extensions/build_context_extensions.dart';
import 'package:stroll_social_assignment/features/task2/presentation/recording_screen/waveform_builder.dart';
import 'package:stroll_social_assignment/utils/app_constants.dart';

import '../recorder_bloc/recorder_bloc.dart';

class AmplitudeBuilder extends StatefulWidget {
  const AmplitudeBuilder({super.key});

  @override
  State<AmplitudeBuilder> createState() => _AmplitudeBuilderState();
}

class _AmplitudeBuilderState extends State<AmplitudeBuilder> {
  final record = AudioRecorder();
  late Directory? dir;
  double currentVolume = 0;

  ScrollController controller = ScrollController();
  Stream<Amplitude>? amplitudeStream;

  double getScrollPosition(RecorderState snapshot) {
    int timeToFillColorInSingleBar =
        ((snapshot.recordedTime / snapshot.waveformValues.length) * 1000)
            .toInt();

    double position = (context.screenWidth / 2) +
        4.2 * ((snapshot.playedTime / timeToFillColorInSingleBar));

    return position;
  }

  void animateWaveBuilder(RecorderState snapshot) {
    if (snapshot is RecorderPlaying) {
      if (snapshot.playedTime == 0) {
        controller.animateTo(context.screenWidth / 2,
            duration:
                const Duration(milliseconds: AppConstants.animationDuration),
            curve: Curves.linear);
      } else {
        controller.animateTo(getScrollPosition(snapshot),
            duration:
                const Duration(milliseconds: AppConstants.animationDuration),
            curve: Curves.linear);
      }
    } else if (snapshot is RecorderPausedPlaying ||
        snapshot is RecorderResumePlaying) {
    } else {
      controller.animateTo(controller.position.maxScrollExtent,
          duration:
              const Duration(milliseconds: AppConstants.animationDuration),
          curve: Curves.linear);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecorderBloc, RecorderState>(
      builder: (context, snapshot) {
        if (controller.hasClients) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            animateWaveBuilder(snapshot);
          });
        }

        return WaveFormBuilder(controller: controller, state: snapshot);
      },
    );
  }
}
