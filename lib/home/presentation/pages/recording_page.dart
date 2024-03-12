
import 'package:flutter/material.dart';
import 'package:stroll_social_assignment/core/extensions/build_context_extensions.dart';
import 'package:stroll_social_assignment/home/presentation/widgets/recording_screen/app_progress_bar.dart';
import 'package:stroll_social_assignment/home/presentation/widgets/recording_screen/name_header.dart';
import 'package:stroll_social_assignment/home/presentation/widgets/recording_screen/recorder_widget.dart';
import 'package:stroll_social_assignment/utils/app_assets.dart';
import '../widgets/recording_screen/profile_question.dart';
import '../widgets/recording_screen/recording_gradient.dart';
import '../widgets/recording_screen/recording_profile_header.dart';

class RecordingPage extends StatefulWidget {
  const RecordingPage({super.key});

  @override
  State<RecordingPage> createState() => _RecordingPageState();
}

class _RecordingPageState extends State<RecordingPage> with SingleTickerProviderStateMixin{

  late Image backgroundImage;
  late AnimationController _controller;
  late Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();
    backgroundImage = Image.asset(AppAssets.profilePicImage);
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _positionAnimation = Tween<Offset>(
      begin: const Offset(0, -0.05),
      end: const Offset(0, 0.0),
    ).animate(_controller);

    _controller.forward();
  }

  //precaching background image which is present in asset images
  //for network image we can use CachedNetworkImage()
  @override
  void didChangeDependencies() {
    precacheImage(backgroundImage.image, context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 800),
        builder: (context, opacity, child) => Opacity(
          opacity: opacity,
          child: Container(
            height: context.screenHeight,
            width: context.screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: backgroundImage.image,
                  fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                const RecordingGradient(),
                SizedBox(
                  height: context.screenHeight,
                  width: context.screenWidth,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 44),
                        const AppProgressBar(progressBars: 2,),
                        const NameHeader(),
                        const Spacer(),
                        SlideTransition(
                          position: _positionAnimation,
                          child: const Column(
                            children: [
                              RecordingProfileHeader(),
                              ProfileQuestion(),
                            ],
                          ),
                        ),
                        const RecorderWidget(),
                        const SizedBox(height: 40)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
