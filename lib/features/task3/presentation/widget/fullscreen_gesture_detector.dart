import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/core/extensions/build_context_extensions.dart';
import '../bloc/gesture/gesture_cubit.dart';
import '../bloc/gesture/gesture_state.dart';

class FullScreenGestureDetector extends StatelessWidget {
  const FullScreenGestureDetector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GestureCubit, GestureState>(
      builder: (context, state) {
        return SizedBox(
          height: context.screenHeight,
          width: context.screenWidth,
          child: GestureDetector(
            onPanUpdate: (details) {
              context.read<GestureCubit>().
              updatePosition(details,context);
            },
          ),
        );
      },
    );
  }
}
