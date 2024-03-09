import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll_social_assignment/utils/app_assets.dart';
import 'package:stroll_social_assignment/utils/app_strings.dart';
import 'package:stroll_social_assignment/utils/app_styles.dart';

class CTAButtons extends StatelessWidget {
  const CTAButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              AppStrings.pickYourOption,
              style: AppStyles.ctaCaptionTextStyle,
            ),
            Text(
              AppStrings.hasSimilarMind,
              style: AppStyles.ctaCaptionTextStyle,
            )
          ],
        ),
        Row(
          children: [
            InkWell(
              onTap: (){
                ///TODO: implement on tap here
              },
              child: Container(
                  height: 44,
                  width: 44,
                  decoration: AppStyles.iconOutlinedDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppAssets.micIcon),
                  )),
            ),
            const SizedBox(
              width: 6,
            ),
            InkWell(
              onTap: (){
                ///TODO: implement on tap here
              },
              child: Container(
                height: 44,
                width: 44,
                decoration: AppStyles.iconFilledDecoration,
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.black,
                  size: 28,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
