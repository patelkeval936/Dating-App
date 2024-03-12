import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/home/presentation/bloc/recorder_bloc/recorder_bloc.dart';
import 'package:stroll_social_assignment/utils/app_assets.dart';
import 'package:stroll_social_assignment/utils/app_colors.dart';

import 'custom_icon_button.dart';

class RecorderCTA extends StatelessWidget {
  const RecorderCTA({super.key, required this.state});

  final RecorderState state;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (state is RecorderInProgress) {
          context.read<RecorderBloc>().add(RecordingStop());
        } else if (state is RecorderCompleted) {
          context.read<RecorderBloc>().add(RecordingPlay());
        } else if (state is RecorderCompletedPlaying) {
          context.read<RecorderBloc>().add(RecordingPlay());
        } else if (state is RecorderPlaying) {
          context.read<RecorderBloc>().add(RecordingPausePlay());
        } else if (state is RecorderPausedPlaying) {
          context.read<RecorderBloc>().add(RecordingResumePlay());
        } else {
          context.read<RecorderBloc>().add(RecordingStart());
        }
      },
      child: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
              color: AppColors.lightGrey.withOpacity(0.7), width: 3.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: (state is RecorderInitial)
              ? Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: Colors.black, width: 4)),
                )
              : (state is RecorderInProgress)
                  ? SizedBox(
                      height: 50,
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black, width: 4)),
                        ),
                      ),
                    )
                  : (state is RecorderCompleted ||
                          state is RecorderPausedPlaying ||
                          state is RecorderCompletedPlaying)
                      ? const CustomIconButton(
                          icon: AppAssets.playIcon,
                          leftPadding: 12,
                        )
                      : (state is RecorderPlaying ||
                              state is RecorderResumePlaying)
                          ? const CustomIconButton(
                              icon: AppAssets.pauseIcon,
                              leftPadding: 8,
                            )
                          : Container(),
        ),
      ),
    );
  }
}
