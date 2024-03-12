import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/core/extensions/build_context_extensions.dart';
import 'package:stroll_social_assignment/utils/app_strings.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_styles.dart';
import '../../bloc/user_bloc/user_bloc.dart';
import '../../bloc/user_bloc/user_bloc_state.dart';

class RecordingProfileHeader extends StatefulWidget {
  const RecordingProfileHeader({super.key});

  @override
  State<RecordingProfileHeader> createState() => _RecordingProfileHeaderState();
}

class _RecordingProfileHeaderState extends State<RecordingProfileHeader> {
  late Image profilePic;

  @override
  void initState() {
    super.initState();
    profilePic = Image.asset(
      AppAssets.profilePicImage,
      cacheHeight: 400,
      cacheWidth: 400,
    );
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
          height: 64,
          width: context.screenWidth,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: AppStyles.profileTextBoxDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(3.33),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image(
                          image: profilePic.image,
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              ),
              Positioned(
                  top: 45,
                  child: Container(
                    decoration: AppStyles.profileBoxDecoration,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      child: Text(
                        AppStrings.strollQuestion,
                        style: AppStyles.profileHeaderTextStyle,
                      ),
                    ),
                  )),
            ],
          ),
        );
      }

      return Container();
    });
  }
}
