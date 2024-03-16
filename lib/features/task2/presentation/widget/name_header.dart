import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/utils/app_styles.dart';
import '../../../task1/presentation/bloc/user_bloc/user_bloc.dart';
import '../../../task1/presentation/bloc/user_bloc/user_bloc_state.dart';

class NameHeader extends StatelessWidget {
  const NameHeader({super.key, this.title, this.showEndIcon = true});

  final String? title;
  final bool showEndIcon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserBlocState>(
      builder: (context, state) {
        if (state is UserSuccess && state.userInfo != null) {
          return Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        splashRadius: 15,
                        iconSize: 20,
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        title ??
                            "${state.userInfo!.name}, ${state.userInfo!.age}",
                        style: AppStyles.nameHeaderTextStyle.copyWith(
                            overflow: TextOverflow.ellipsis,
                            fontSize: title != null ? 16 : 18),
                      ),
                    ),
                  ),
                  showEndIcon
                      ? Material(
                          color: Colors.transparent,
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              splashRadius: 15,
                              iconSize: 20,
                              onPressed: () {},
                              color: Colors.white,
                              icon: const Icon(Icons.more_horiz_rounded)))
                      : const SizedBox(
                          height: 30,
                          width: 30,
                        ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
