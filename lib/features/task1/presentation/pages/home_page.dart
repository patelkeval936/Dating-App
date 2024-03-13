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

  late Image backgroundImage;

  @override
  void initState() {
    super.initState();
    backgroundImage = Image.asset(AppAssets.bgImage);
  }

  //precaching background image which is present in asset images
  //for network image we can use CachedNetworkImage()
  @override
  void didChangeDependencies() {
    precacheImage(backgroundImage.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.screenHeight,
        width: context.screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: backgroundImage.image,
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
