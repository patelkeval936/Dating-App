import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll_social_assignment/features/task3/presentation/bloc/bottom_nav/bottom_nav_cubit.dart';

import 'navbar_badge.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({super.key,
    required this.icon,
    required this.label,
    required this.showBadge,
    required this.badgeValue,
    required this.index});

  final String icon;
  final String label;
  final bool showBadge;
  final String badgeValue;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        return Material(
          color: Colors.transparent,
          child: IconButton(
            splashRadius: 24,
            onPressed: () {
              context.read<BottomNavCubit>().changeSelectedIndexTo(index);
            },
            iconSize: 44,
            icon: SizedBox(
              height: 44,
              width: 44,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    child: SvgPicture.asset(icon,
                        height: 28,
                        color: context
                            .read<BottomNavCubit>()
                            .state == index
                            ? Colors.white
                            : null),
                  ),
                  NavbarBadge(showBadge: showBadge, value: badgeValue)
                ],
              ),
            ),
          ),
        );
      },
    );
    ;
  }
}
