import 'dart:io';
import 'package:flutter/material.dart';
import 'package:stroll_social_assignment/utils/app_colors.dart';
import 'package:stroll_social_assignment/utils/app_strings.dart';
import '../../../utils/app_assets.dart';
import 'bottom_navbar_item.dart';

Widget get bottomNavigationBar => Container(
      height: Platform.isIOS ? 76 : 64,
      color: AppColors.navBarColor,
      child: Padding(
        padding: EdgeInsets.only(bottom: Platform.isIOS ? 12 : 0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavBarItem(
                icon: AppAssets.swipeCardsIcon,
                label: AppStrings.swipe,
                showBadge: false,
                badgeValue: ''),
            BottomNavBarItem(
                icon: AppAssets.matchesIcon,
                label: AppStrings.match,
                showBadge: true,
                badgeValue: ''),
            BottomNavBarItem(
                icon: AppAssets.chatIcon,
                label: AppStrings.chat,
                showBadge: true,
                badgeValue: '10'),
            BottomNavBarItem(
                icon: AppAssets.userIcon,
                label: AppStrings.profile,
                showBadge: false,
                badgeValue: ''),
          ],
        ),
      ),
    );
