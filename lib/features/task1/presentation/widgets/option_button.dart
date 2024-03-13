import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/core/extensions/build_context_extensions.dart';
import 'package:stroll_social_assignment/utils/app_styles.dart';

import '../bloc/option_cubit/option_cubit.dart';

class OptionButton extends StatelessWidget {
  const OptionButton(
      {super.key,
      required this.isActive,
      required this.title,
      required this.option});

  final bool isActive;
  final String title;
  final String option;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<OptionCubit>().selectOption(option);
      },
      child: Container(
        constraints: BoxConstraints(maxWidth: context.screenWidth * 0.44),
        decoration: AppStyles.optionButtonDecoration(isActive),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 14,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5, right: 8),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: AppStyles.optionDecoration(isActive),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                        child: Text(
                      option,
                      style: const TextStyle(fontSize: 10),
                    )),
                  ),
                ),
              ),
              Expanded(
                  child: Text(
                title,
                style: AppStyles.optionButtonTextStyle,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
