
import 'package:flutter/material.dart';
import 'package:stroll_social_assignment/utils/app_colors.dart';
import 'package:stroll_social_assignment/utils/app_constants.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      fontFamily: AppConstants.proximaNova,
      useMaterial3: false,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      fontFamily: AppConstants.proximaNova,
      useMaterial3: false,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: AppColors.primaryColor,
      ),
      appBarTheme: const AppBarTheme(
        color: AppColors.primaryColor
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Colors.transparent
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent
      )
    );
  }
}
