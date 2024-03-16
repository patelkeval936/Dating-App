import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/features/task3/data/models/user_model.dart';
import 'package:stroll_social_assignment/features/task3/presentation/widget/profile_maker.dart';
import '../../../../utils/app_constants.dart';
import '../../data/models/scrolled_position.dart';
import '../../data/models/users.dart';
import '../bloc/gesture/gesture_cubit.dart';
import '../bloc/gesture/gesture_state.dart';

class NearByUsersLayer extends StatelessWidget {
  const NearByUsersLayer({super.key});

  ScrolledPosition generateRandomPosition(double height, double width) {
    double fromTop = 0;
    double fromLeft = 0;

    fromTop = Random().nextInt(height.toInt() - 100).toDouble() + 100;
    fromLeft = Random().nextInt(width.toInt() - 100).toDouble() + 100;

    return ScrolledPosition(fromLeft, fromTop);
  }

  ScrolledPosition? getPosition(
      Users users, int index, double height, double width) {
    List<UserModel> userData = users.users;

    if (height != 0 && width != 0) {
      ScrolledPosition? currentElement = userData[index].position;

      if (currentElement == null) {
        return generateRandomPosition(height, width);
      } else {
        return currentElement;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GestureCubit, GestureState>(
      builder: (context, state) {
        return SizedBox(
          height: state.videoHeight,
          width: state.videoWidth,
          child: Stack(
            children: [
              ...state.users.users.map((user) {

                if (user.position == null) {
                  ScrolledPosition? position = getPosition(
                      state.users,
                      state.users.users.indexOf(user),
                      state.videoHeight,
                      state.videoWidth);
                  user.position = position;
                }

                return AnimatedPositioned(
                    top: user.position?.fromTop,
                    left: user.position?.fromLeft,
                    duration: const Duration(
                        milliseconds: AppConstants.panUpdateAnimationDuration),
                    child: ProfileMaker(user: user));
              })
            ],
          ),
        );
      },
    );
  }
}
