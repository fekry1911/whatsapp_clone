import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/colors/app_colors.dart';

class StoryDesign extends StatelessWidget {
  StoryDesign({super.key, required this.image, required this.name});

  String image;
  String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
      height: 150.h,
      width: 75.w,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),

            child: Image.network(
              image,
              fit: BoxFit.cover,
              height: 150.h,
              width: 75.w,
            ),
          ),
          Positioned(bottom: 3.h,left:3.w, child: Text(name, maxLines: 2,style:TextStyle(color:AppColors.mainLightColor))),
          Positioned(
            top: 5.h,
            left: 3.w,
            child: CircleAvatar(
              backgroundColor: AppColors.appBarChatLight,

              radius: 25.r,
              child: CircleAvatar(
                radius: 20.r,
                backgroundImage: NetworkImage(image),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
