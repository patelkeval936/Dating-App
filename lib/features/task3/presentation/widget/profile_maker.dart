import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/features/task3/data/models/user_model.dart';
import 'package:stroll_social_assignment/utils/app_colors.dart';
import 'package:stroll_social_assignment/utils/app_strings.dart';
import '../../../../utils/app_styles.dart';
import '../bloc/gesture/gesture_cubit.dart';
import '../bloc/gesture/gesture_state.dart';

class ProfileMaker extends StatefulWidget {
  const ProfileMaker({super.key, required this.user});

  final UserModel user;

  @override
  State<ProfileMaker> createState() => _ProfileMakerState();
}

class _ProfileMakerState extends State<ProfileMaker> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GestureCubit, GestureState>(
      builder: (context, state) {
        int index = state.users.users.indexWhere(
            (element) => element.profileUrl == widget.user.profileUrl);

        return GestureDetector(
          onTap: () {
            context.read<GestureCubit>().setSelectedIndex(index: index);
          },
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      widget.user.profileUrl,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: state.selectedIndex == index ? 1 : 0,
                duration: const Duration(milliseconds: 400),
                child: Container(
                  height: 64,
                  width: 160,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.profileBorder, width: 2),
                      color: const Color.fromRGBO(18, 17, 30, 1),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 4, bottom: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            widget.user.profileUrl,
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const SizedBox();
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, top: 4, bottom: 0, right: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.user.name}, ${widget.user.age}",
                                    style: AppStyles.profileHeaderTextStyle,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            140, 138, 235, 1),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 6),
                                    child: Text(
                                      AppStrings.noVoiceAnswer,
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontStyle: FontStyle.italic,
                                          color:
                                              Color.fromRGBO(215, 213, 223, 1)),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
