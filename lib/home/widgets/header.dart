
import 'package:flutter/material.dart';
import 'package:stroll_social_assignment/home/widgets/subtitle.dart';

import '../../utils/app_assets.dart';
import '../models/user_model.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              user.title,
              style: TextStyle(
                color: const Color(0xffCCC8FF),
                fontWeight: FontWeight.w700,
                fontSize: 34,
                height: 1.25,
                shadows: [
                  const Shadow(
                    color: Color(0xFFBEBEBE),
                    offset: Offset.zero,
                    blurRadius: 8,
                  ),
                  Shadow(
                    color:
                    const Color(0xFF24232F).withOpacity(0.5),
                    offset: const Offset(0, 0.99),
                    blurRadius: 16,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(
                splashRadius: 15,
                constraints: const BoxConstraints(maxWidth: 30),
                color: const Color(0xffCBC9FF),
                padding: EdgeInsets.zero,
                iconSize: 25,
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  // size: 20,
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Subtitle(
                leadingIcon: AppAssets.clockIcon,
                text: user.time),
            const SizedBox(
              width: 10,
            ),
            Subtitle(
                leadingIcon: AppAssets.userSmallIcon,
                text: user.followers.toString()),
          ],
        )
      ],
    );
  }
}
