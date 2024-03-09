import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll_social_assignment/utils/app_styles.dart';

class HeadingSubtitle extends StatelessWidget {
  const HeadingSubtitle(
      {super.key, required this.leadingIcon, required this.text});

  final String leadingIcon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SvgPicture.asset(
          leadingIcon,
          height: 15,
          width: 15,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: AppStyles.headerSubtitleStyle,
        ),
      ],
    );
  }
}
