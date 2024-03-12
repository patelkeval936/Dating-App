import 'package:flutter/material.dart';
import 'package:stroll_social_assignment/core/extensions/build_context_extensions.dart';

class RecordingGradient extends StatelessWidget {
  const RecordingGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight,
      width: context.screenWidth,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [
                  0.2557,
                  0.4695,
                  0.5397,
                  0.6025,
                  0.6136,
                  0.6368,
                  0.6675,
                  0.6942
                ],
                colors: [
                  const Color(0xff0f1115).withOpacity(0),
                  const Color(0xff0f1114).withOpacity(0.05),
                  const Color(0xff0f1113).withOpacity(0.13),
                  const Color(0xff0f1113).withOpacity(0.16),
                  const Color(0xff0f1112).withOpacity(0.20),
                  const Color(0xff0d0e12).withOpacity(0.46),
                  const Color(0xff0c0d11).withOpacity(0.50),
                  const Color(0xff0c0d11).withOpacity(0.52),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [
                  const Color(0xff000000).withOpacity(0.27),
                  const Color(0xff000000).withOpacity(0.15),
                  const Color(0xff000000).withOpacity(0.08),
                  const Color(0xff000000).withOpacity(0.05),
                  const Color(0xff000000).withOpacity(0.0),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0,-0.3),
                radius: 1,
                colors: [
                  const Color(0xff000000).withOpacity(0.10),
                  const Color(0xff000000).withOpacity(0.11),
                  const Color(0xff000000).withOpacity(0.13),
                  const Color(0xff000000).withOpacity(0.15),
                  const Color(0xff000000).withOpacity(0.19),
                  const Color(0xff000000).withOpacity(0.24),
                  const Color(0xff000000).withOpacity(0.30),
                  const Color(0xff000000).withOpacity(0.35),
                  const Color(0xff000000).withOpacity(0.37),
                  const Color(0xff000000).withOpacity(0.39),
                  const Color(0xff000000).withOpacity(0.42),
                  const Color(0xff000000).withOpacity(0.43),
                  const Color(0xff000000).withOpacity(0.45),
                  const Color(0xff000000).withOpacity(0.46),
                  const Color(0xff000000).withOpacity(0.48),
                  const Color(0xff000000).withOpacity(0.49),
                  const Color(0xff000000).withOpacity(0.51),
                  const Color(0xff000000).withOpacity(0.52),
                  const Color(0xff000000).withOpacity(0.54),
                  const Color(0xff000000).withOpacity(0.57),
                  const Color(0xff000000).withOpacity(0.58),
                  const Color(0xff000000).withOpacity(0.58),
                  const Color(0xff000000).withOpacity(0.59),
                  const Color(0xff000000).withOpacity(0.61),
                  const Color(0xff000000).withOpacity(0.65),
                  const Color(0xff000000).withOpacity(0.67),
                  const Color(0xff000000).withOpacity(0.70),
                  const Color(0xff000000).withOpacity(0.75),
                  const Color(0xff000000).withOpacity(0.76),
                  const Color(0xff000000).withOpacity(0.78),
                  const Color(0xff000000).withOpacity(0.80),
                  const Color(0xff000000).withOpacity(0.88),
                  const Color(0xff000000).withOpacity(0.90),
                  const Color(0xff000000).withOpacity(0.92),
                  const Color(0xff000000).withOpacity(0.95),
                  const Color(0xff000000).withOpacity(1),
                ],
              ),
              // backgroundBlendMode: BlendMode.srcOver,
            ),
          ),
        ],
      ),
    );
  }
}
