
import 'package:flutter/material.dart';
import '../../utils/app_assets.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left:40,
            top: 8,
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xff0D0F11),
                  borderRadius: BorderRadius.circular(30)
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                child: Row(
                  children: [
                    SizedBox(width: 28,),
                    Text('Angelina, 28',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                      height: 1.2
                    ),
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
            decoration: BoxDecoration(
                color: const Color(0xff0D0F11),
                borderRadius: BorderRadius.circular(30)
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child : Image.asset(AppAssets.profilePicImage,height: 50,width: 50,fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
