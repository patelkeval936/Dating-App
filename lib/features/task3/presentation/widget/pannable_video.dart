import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/features/task3/data/models/scrolled_position.dart';
import 'package:stroll_social_assignment/injection_container.dart';
import 'package:stroll_social_assignment/features/task3/data/data_sources/cached_video_initialiser.dart';
import '../../../../utils/app_constants.dart';
import '../bloc/gesture/gesture_cubit.dart';
import '../bloc/gesture/gesture_state.dart';

class PannableVideo extends StatefulWidget {
  const PannableVideo({super.key});

  @override
  State<PannableVideo> createState() => _PannableVideoState();
}

class _PannableVideoState extends State<PannableVideo> {

  CachedVideoInitialiser videoInitialiser = sl<CachedVideoInitialiser>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GestureCubit, GestureState>(
      builder: (context, state) {
        
        ScrolledPosition currentPosition = state.position;

        double videoHeight = state.videoHeight;
        double videoWidth = state.videoWidth;

        return AnimatedPositioned(
          duration: const Duration(
              milliseconds: AppConstants.panUpdateAnimationDuration),
          left: -currentPosition.fromLeft,
          top: -currentPosition.fromTop,
          child: SizedBox.fromSize(
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: SizedBox(
                height: videoHeight == 0 ? 1 : videoHeight,
                width: videoWidth == 0 ? 1 : videoWidth,
                child: BetterPlayer(
                    controller: videoInitialiser.betterPlayerController),
              ),
            ),
          ),
        );
      },
    );
  }
}
