
import 'package:flutter/material.dart';
import 'package:stroll_social_assignment/core/extensions/build_context_extensions.dart';

class HomePageGradient extends StatelessWidget {
  const HomePageGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight,
      width: context.screenWidth,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xff000000).withOpacity(0.4),
              const Color(0xff000000).withOpacity(0.3),
              const Color(0xff000000).withOpacity(0),
              const Color(0xff000000).withOpacity(0),
              const Color(0xff000000).withOpacity(0.9),
              const Color(0xff000000).withOpacity(1.0),
              const Color(0xff000000).withOpacity(1.0),
              const Color(0xff000000).withOpacity(1.0),
            ],
          )),
    );
  }
}
