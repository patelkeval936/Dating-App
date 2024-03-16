import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:stroll_social_assignment/core/extensions/build_context_extensions.dart';
import 'package:stroll_social_assignment/features/task3/data/models/scrolled_position.dart';
import 'package:stroll_social_assignment/features/task3/data/models/users.dart';
import 'gesture_state.dart';

class GestureCubit extends Cubit<GestureState> {
  GestureCubit()
      : super(
          GestureState(
            users: Users(users: []),
            selectedIndex: null,
            position: ScrolledPosition(0, 0),
            videoHeight: 0,
            videoWidth: 0,
          ),
        );

  void setUsers({required Users? users}) {
    if (users != null) {
      state.users = users;
    }
    emit(state.copyWith(users: state.users));
  }

  void setSelectedIndex({required int index}) {
    state.selectedIndex = index;
    emit(state.copyWith(selectedIndex: state.selectedIndex));
  }

  void setVideoSize({required double height, required double width}) {
    state.videoWidth = width;
    state.videoHeight = height;
    emit(state.copyWith(videoHeight: height, videoWidth: width));
  }

  void updatePosition(DragUpdateDetails details, BuildContext context) {
    double positionY = state.position.fromTop - details.delta.dy;
    if (positionY > 0 && positionY < state.videoHeight - context.screenHeight) {

      for (var element in state.users.users) {
        double newYPosition = element.position!.fromTop + details.delta.dy;
        element.position!.fromTop = newYPosition;
      }

      state.position.fromTop = positionY;
    }

    double positionX = state.position.fromLeft - details.delta.dx;
    if (positionX > 0 && positionX < state.videoWidth - context.screenWidth) {

      for (var element in state.users.users) {
        double newXPosition = element.position!.fromLeft + details.delta.dx;
        element.position!.fromLeft = newXPosition;
      }

      state.position.fromLeft = positionX;

      emit(state.copyWith(users: state.users));
    }
  }
}
