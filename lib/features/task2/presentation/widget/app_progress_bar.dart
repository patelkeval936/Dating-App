import 'package:flutter/material.dart';
import 'package:stroll_social_assignment/core/extensions/build_context_extensions.dart';

class AppProgressBar extends StatelessWidget {
  const AppProgressBar({super.key, required this.progressBars});

  final int progressBars;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      width: context.screenWidth,
      child: Row(
        children: [
          for (int i = 0; i < progressBars; i++)
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 3,
              ),
              child: LinearProgressIndicator(
                value: i == 0 ? 100 : 0,
                color: Colors.white,
                backgroundColor: const Color(0xff878787).withOpacity(0.5),
                borderRadius: BorderRadius.circular(4),
              ),
            ))
        ],
      ),
    );
  }
}
