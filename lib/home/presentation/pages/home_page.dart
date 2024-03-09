import 'package:flutter/material.dart';
import 'package:stroll_social_assignment/core/extensions/build_context_extensions.dart';
import 'package:stroll_social_assignment/utils/app_assets.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/header.dart';
import '../widgets/homepage_gradient.dart';
import '../widgets/question_and_options.dart';
import '../widgets/cta_buttons.dart';

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
            const HomePageGradient(),
            SizedBox(
              height: context.screenHeight,
              width: context.screenWidth,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 58),
                    Header(),
                    Spacer(),
                    QuestionAndOptions(),
                    CTAButtons(),
                    SizedBox(height: 8)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
