import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/core/extensions/build_context_extensions.dart';
import 'package:stroll_social_assignment/features/task3/presentation/bloc/gesture/gesture_cubit.dart';
import 'package:stroll_social_assignment/features/task3/presentation/bloc/user/user_bloc.dart';
import 'package:stroll_social_assignment/features/task3/presentation/bloc/user/user_state.dart';
import 'package:stroll_social_assignment/features/task3/presentation/widget/fullscreen_gesture_detector.dart';
import 'package:stroll_social_assignment/features/task3/presentation/widget/near_by_users.dart';
import '../../../../injection_container.dart';
import '../../data/data_sources/cached_video_initialiser.dart';
import '../../../task1/presentation/widgets/bottom_nav_bar.dart';
import '../widget/pannable_video.dart';
import '../widget/selected_user_info_layer.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {

  double? aspectRatio;

  CachedVideoInitialiser videoInitialiser = sl<CachedVideoInitialiser>();

  void setInitialPosition() {
    double? newAspectRatio =
        videoInitialiser.betterPlayerController.getAspectRatio();

    if (newAspectRatio != null && aspectRatio != newAspectRatio) {
      aspectRatio = newAspectRatio;
      WidgetsFlutterBinding.ensureInitialized()
          .addPostFrameCallback((timeStamp) {
        double videoHeight = context.screenHeight * 2;
        double videoWidth = videoHeight * aspectRatio!;

        context
            .read<GestureCubit>()
            .setVideoSize(height: videoHeight, width: videoWidth);
      });
    }
  }

  @override
  void initState() {
    setInitialPosition();
    videoInitialiser.betterPlayerController.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: BlocConsumer<UsersInfoBloc, UserState>(
          listener: (BuildContext context, UserState state) {
            context.read<GestureCubit>().setUsers(users: state.users);
          },
          builder: (context, state) {
            return const Stack(
              children: [
                PannableVideo(),
                NearByUsersLayer(),
                FullScreenGestureDetector(),
                SelectedUerInfoLayer()
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(showBackground: false),
    );
  }
}
