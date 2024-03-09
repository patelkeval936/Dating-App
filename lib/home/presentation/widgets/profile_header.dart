import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/core/extensions/build_context_extensions.dart';
import 'package:stroll_social_assignment/home/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:stroll_social_assignment/home/presentation/bloc/user_bloc/user_bloc_state.dart';
import 'package:stroll_social_assignment/utils/app_styles.dart';

import '../../../utils/app_assets.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  late Image profilePic;

  @override
  void initState() {
    super.initState();
    profilePic = Image.asset(AppAssets.profilePicImage);
  }

  //precaching background image which is present in asset images
  @override
  void didChangeDependencies() {
    precacheImage(profilePic.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserBlocState>(builder: (context, state) {
      if (state is UserLoading) {
        return const CircularProgressIndicator();
      }

      if (state is UserFailed) {
        return Text(
          state.message,
          style: const TextStyle(color: Colors.red),
        );
      }

      if (state is UserSuccess && state.userInfo != null) {
        return SizedBox(
          height: 60,
          width: context.screenWidth,
          child: Stack(
            children: [
              Positioned(
                  left: 40,
                  top: 8,
                  child: Container(
                    decoration: AppStyles.profileBoxDecoration,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 28,
                          ),
                          Text(
                            '${state.userInfo?.name ?? ''}, ${state.userInfo?.age}',
                            style: AppStyles.profileHeaderTextStyle,
                          ),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                left: 10,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: AppStyles.profileTextBoxDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image(
                          image: profilePic.image,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      return Container();
    });
  }
}
