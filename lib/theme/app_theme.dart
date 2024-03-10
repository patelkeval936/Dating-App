
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF13B9FF),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      fontFamily: 'ProximaNova',
      useMaterial3: false,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color(0xff8B88EF),
      ),
    );
  }
}
