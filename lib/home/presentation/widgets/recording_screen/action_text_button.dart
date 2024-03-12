import 'package:flutter/material.dart';
import 'package:stroll_social_assignment/home/presentation/bloc/recorder_bloc/recorder_bloc.dart';
import 'package:stroll_social_assignment/utils/app_colors.dart';
import 'package:stroll_social_assignment/utils/app_styles.dart';

class ActionTextButtons extends StatelessWidget {
  const ActionTextButtons(
      {super.key,
      required this.state,
      required this.text,
      required this.isRed,
      required this.action});

  final RecorderState state;
  final String text;
  final bool isRed;
  final Function action;

  Color getFontColor() {
    if (state.runtimeType.toString() == "RecorderInitial" &&
        state.runtimeType.toString() == "RecorderInProgress") {
      if (isRed) {
        return AppColors.disabledRed;
      } else {
        return AppColors.disabledBlack;
      }
    } else {
      if (isRed) {
        return AppColors.enabledRed;
      } else {
        return AppColors.optionWhite;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (state.runtimeType.toString() != "RecorderInitial" &&
              state.runtimeType.toString() != "RecorderInProgress") {
            action();
          }
        },
        child: Text(
          text,
          style: AppStyles.optionButtonTextStyle.copyWith(
            color: getFontColor(),
          ),
        ));
  }
}
