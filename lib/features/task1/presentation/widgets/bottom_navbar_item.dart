

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'navbar_badge.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem(
      {super.key,
        required this.icon,
        required this.label,
        required this.showBadge,
        required this.badgeValue});

  final String icon;
  final String label;
  final bool showBadge;
  final String badgeValue;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        splashRadius: 24,
        onPressed: () {},
        iconSize: 44,
        icon: SizedBox(
          height: 44,
          width: 44,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: SvgPicture.asset(
                  icon,
                  height: 28,
                ),
              ),
              NavbarBadge(showBadge: showBadge, value: badgeValue)
            ],
          ),
        ),
      ),
    );
    ;
  }
}