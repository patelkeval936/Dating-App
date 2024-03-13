import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../recorder_bloc/recorder_bloc.dart';

class RecorderProgressText extends StatelessWidget {
  const RecorderProgressText({
    super.key,
    required this.state,
  });

  final RecorderState state;

  String buildTimeString(int time) {
    int minutes = time ~/ 60;
    int seconds = time % 60;

    return "${minutes < 10 ? '0' : ''}$minutes:${seconds < 10 ? '0' : ''}$seconds";
  }

  TextStyle getTextStyle(RecorderState state) {
    if (state is RecorderInitial) {
      return AppStyles.optionButtonTextStyle;
    } else if (state is RecorderInProgress) {
      return AppStyles.optionButtonTextStyle
          .copyWith(color: AppColors.lightPurple);
    } else {
      return AppStyles.optionButtonTextStyle
          .copyWith(color: AppColors.lightGrey);
    }
  }

  String getText(RecorderState state) {
    if (state is RecorderInitial) {
      return buildTimeString(state.recordedTime);
      ;
    } else if (state is RecorderInProgress) {
      return buildTimeString(state.recordedTime);
    } else {
      return "${buildTimeString(state.playedTime ~/ 1000)} / ${buildTimeString(state.recordedTime)}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          getText(state),
          style: getTextStyle(state),
        ));
  }
}
