import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll_social_assignment/core/extensions/build_context_extensions.dart';
import 'package:stroll_social_assignment/home/widgets/sub_headers.dart';
import 'package:stroll_social_assignment/utils/app_assets.dart';

import '../models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.screenHeight,
        width: context.screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppAssets.bgImage,
              ),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Container(
              height: context.screenHeight,
              width: context.screenWidth,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xff000000).withOpacity(0),
                  const Color(0xff000000).withOpacity(0.15),
                  const Color(0xff000000).withOpacity(0.25),
                  const Color(0xff000000).withOpacity(0.35),
                  const Color(0xff000000).withOpacity(0.6),
                  const Color(0xff000000).withOpacity(0.85),
                  const Color(0xff000000).withOpacity(1),
                  const Color(0xff000000).withOpacity(1),
                  const Color(0xff000000).withOpacity(1),
                ],
                // stops: [0,28,64,80,100]
              )),
            ),
          ],
        ),
      ),
    );
  }
}
