import 'package:flutter/material.dart';
import 'package:stroll_social_assignment/utils/app_styles.dart';

class NavbarBadge extends StatelessWidget {
  const NavbarBadge({
    super.key,
    required this.showBadge,
    required this.value,
  });

  final bool showBadge;
  final String value;

  @override
  Widget build(BuildContext context) {
    return showBadge
        ? Positioned(
            top: 2,
            right: -2,
            child: SizedBox(
              width: 24,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: 12,
                  decoration: AppStyles.badgeDecoration,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 0,
                    ),
                    child: Text(
                      value,
                      style: AppStyles.badgeTextStyle,
                    ),
                  )),
                ),
              ),
            ))
        : Container();
  }
}
