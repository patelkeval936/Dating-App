import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/utils/app_colors.dart';
import 'package:stroll_social_assignment/utils/app_strings.dart';
import '../../../../utils/app_assets.dart';
import '../../../task3/presentation/bloc/bottom_nav/bottom_nav_cubit.dart';
import 'bottom_navbar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, this.showBackground = true});

  final bool showBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Platform.isIOS ? 76 : 64,
      color: showBackground ? AppColors.navBarColor : Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(bottom: Platform.isIOS ? 12 : 0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavBarItem(
              icon: AppAssets.swipeCardsIcon,
              label: AppStrings.swipe,
              showBadge: false,
              badgeValue: '',
              index: 0,
            ),
            BottomNavBarItem(
              icon: AppAssets.matchesIcon,
              label: AppStrings.match,
              showBadge: false,
              badgeValue: '',
              index: 1,
            ),
            BottomNavBarItem(
              icon: AppAssets.chatIcon,
              label: AppStrings.chat,
              showBadge: true,
              badgeValue: '10',
              index: 2,
            ),
            BottomNavBarItem(
              icon: AppAssets.userIcon,
              label: AppStrings.profile,
              showBadge: false,
              badgeValue: '',
              index: 3,
            ),
          ],
        ),
      ),
    );
  }
}
