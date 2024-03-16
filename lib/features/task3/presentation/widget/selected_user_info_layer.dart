import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/core/extensions/build_context_extensions.dart';
import 'package:stroll_social_assignment/features/task2/presentation/widget/name_header.dart';
import 'package:stroll_social_assignment/features/task3/data/models/user_model.dart';
import 'package:stroll_social_assignment/utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/app_styles.dart';
import '../bloc/gesture/gesture_cubit.dart';
import '../bloc/gesture/gesture_state.dart';

class SelectedUerInfoLayer extends StatefulWidget {
  const SelectedUerInfoLayer({super.key});

  @override
  State<SelectedUerInfoLayer> createState() => _SelectedUerInfoLayerState();
}

class _SelectedUerInfoLayerState extends State<SelectedUerInfoLayer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight,
      width: context.screenWidth,

      child: BlocBuilder<GestureCubit, GestureState>(
        builder: (context, state) {
          int? selectedUserIndex = state.selectedIndex;

          UserModel? user;
          if (selectedUserIndex != null) {
            user = state.users.users[selectedUserIndex];
          }

          return Stack(
            children: [
              Positioned(
                  top: 46,
                  child: SizedBox(
                    width: context.screenWidth,
                    height: 60,
                    child: const NameHeader(
                      title: AppStrings.its2005,
                      showEndIcon: false,
                    ),
                  )),
              if (user != null)
                Positioned(
                  bottom: 90,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    width: context.screenWidth,
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.profileBorder,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(35),
                                  child: Image.network(
                                    user.profileUrl,
                                    height: 50,
                                    width: 50,
                                  )),
                            ),
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            height: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${user.name}, ${user.age}',
                                  style: AppStyles.profileHeaderTextStyle
                                      .copyWith(fontSize: 16),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Container(
                                    decoration:
                                        AppStyles.profileBoxDecoration,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(right: 4),
                                            child: Icon(
                                              CupertinoIcons.search,
                                              size: 12,
                                            ),
                                          ),
                                          Text(
                                            AppStrings.openToAll,
                                            style: AppStyles
                                                .headerSubtitleStyle
                                                .copyWith(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              Positioned(
                bottom: 90,
                right: 16,
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Text('🎙️', style: AppStyles.iconTextStyle)),
                    IconButton(
                        onPressed: () {},
                        icon: Text('👏', style: AppStyles.iconTextStyle)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.location_on_outlined)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.settings)),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
