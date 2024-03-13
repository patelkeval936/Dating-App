import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.icon, required this.leftPadding});

  final String icon;
  final double leftPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Padding(
        padding:
        EdgeInsets.only(top: 12, bottom: 12, left: leftPadding, right: 8),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
