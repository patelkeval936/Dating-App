import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll_social_assignment/utils/app_styles.dart';

import '../../../../utils/app_assets.dart';
import '../bloc/header_bloc/header_bloc.dart';
import '../bloc/header_bloc/header_bloc_state.dart';
import 'heading_subtitle.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HeaderBloc, HeaderBlocState>(builder: (context, state) {

      if (state is HeaderLoading) {
        return const CircularProgressIndicator();
      }

      if (state is HeaderFailed) {
        return Text(state.message,style: AppStyles.errorStyle);
      }

      if (state is HeaderSuccess && state.headerInfo != null) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  state.headerInfo?.title ?? '',
                  style: AppStyles.headerTextStyle,
                ),
                const SizedBox(
                  width: 5,
                ),
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                      splashRadius: 10,
                      constraints: const BoxConstraints(maxWidth: 20,maxHeight: 20),
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Center(
                            child: SvgPicture.asset(
                          AppAssets.arrowDownIcon,
                          width: 12,
                        )),
                      )),
                )
              ],
            ),
            const SizedBox(height: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HeadingSubtitle(
                    leadingIcon: AppAssets.clockIcon,
                    text: state.headerInfo?.time ?? ''),
                const SizedBox(
                  width: 10,
                ),
                HeadingSubtitle(
                    leadingIcon: AppAssets.userSmallIcon,
                    text: state.headerInfo?.followers.toString() ?? ''),
              ],
            )
          ],
        );
      }

      return Container();
    });
  }
}
