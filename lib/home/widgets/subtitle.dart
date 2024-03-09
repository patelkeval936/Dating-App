
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Subtitle extends StatelessWidget {
  const Subtitle({super.key, required this.leadingIcon, required this.text});

  final String leadingIcon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
