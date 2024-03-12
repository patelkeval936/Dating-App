import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyles {

  //text styles
  static const errorStyle = TextStyle(
    color: AppColors.errorColor,
  );

  static const headerSubtitleStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1,
  );

  static const optionButtonTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.optionWhite,
  );

  static const enabledButtonTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.optionWhite,
  );

  static const disabledButtonTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.disabledBlack,
  );

  static const profileHeaderTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 11,
    height: 1.2,
  );

  static const badgeTextStyle = TextStyle(
    fontSize: 7,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w700,
  );

  static const ctaCaptionTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle answerCaptionStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 1.2,
      fontStyle: FontStyle.italic,
      color: AppColors.captionPurple.withOpacity(0.7));

  static TextStyle headerTextStyle = TextStyle(
    color: AppColors.headerColor,
    fontWeight: FontWeight.w700,
    fontSize: 34,
    height: 1.25,
    shadows: [
      Shadow(
        color: AppColors.blackColor.withOpacity(0.2),
        offset: Offset.zero,
        blurRadius: 8,
      ),
      const Shadow(
        color: AppColors.lightShadowColor,
        offset: Offset.zero,
        blurRadius: 2,
      ),
      Shadow(
        color: AppColors.darkShadowColor.withOpacity(0.5),
        offset: const Offset(0, 1),
        blurRadius: 2,
      ),
    ],
  );

  static TextStyle nameHeaderTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    height: 1.25,

    shadows: [
      Shadow(
        color: AppColors.lightShadow,
        offset: Offset(0, 1.08),
        blurRadius: 1.08,
      ),
    ],
  );


  //box decorations

  static BoxDecoration badgeDecoration = BoxDecoration(
    color: AppColors.badgeBackgroundColor,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: AppColors.borderBlack,
    ),
  );

  static BoxDecoration optionButtonDecoration(bool isActive) => BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(12),
          border: isActive
              ? Border.all(color: AppColors.primaryColor, width: 2)
              : Border.all(color: Colors.transparent, width: 2),
          boxShadow: const [
            BoxShadow(
                offset: Offset(-1, -1),
                blurRadius: 2,
                spreadRadius: 0,
                color: AppColors.lightShadow),
            BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 2,
                spreadRadius: 0,
                color: AppColors.greyShadowColor),
            BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 8,
                spreadRadius: 0,
                color: AppColors.lightShadow),
          ]);

  static BoxDecoration optionDecoration(bool isActive) => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isActive ? AppColors.primaryColor : null,
        border: Border.all(
          color: AppColors.optionWhite,
          width: 1,
        ),
      );

  static BoxDecoration profileBoxDecoration = BoxDecoration(
    color: AppColors.darkGreyColor.withOpacity(0.9),
    borderRadius: BorderRadius.circular(30),
  );

  static BoxDecoration profileTextBoxDecoration = BoxDecoration(
    color: AppColors.darkGreyColor.withOpacity(0.9),
    borderRadius: BorderRadius.circular(30),
  );

  static BoxDecoration iconOutlinedDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(22),
    border: Border.all(
      color: AppColors.primaryColor,
      width: 2,
    ),
  );

  static BoxDecoration iconFilledDecoration = BoxDecoration(
    color: AppColors.primaryColor,
    borderRadius: BorderRadius.circular(22),
    border: Border.all(
      color: AppColors.primaryColor,
      width: 2,
    ),
  );
}
