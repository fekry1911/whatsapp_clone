import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/colors/app_colors.dart';

class UserCard extends StatelessWidget {
  UserCard({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.imageUrl,
    required this.isMe,
    required this.isRead,
  });

  final String name;
  final String message;
  final String time;
  final String imageUrl;
  final bool isMe;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;


    return Card(
      color: theme.cardTheme.color,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 20.h),
              child: CircleAvatar(
                radius: 30.r,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontSize: 18.sp,
                            color: isDark?AppColors.mainLightColor:AppColors.blackColor,
                          ),
                        ),
                        Text(
                          time,
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontSize: 14.sp,
                            color: Colors.grey[700]
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if(isMe) ...[
                          Icon(
                            Icons.done_all ,
                            color: isRead ? Colors.blue : Colors.grey,
                          )],
                        SizedBox(width: 4.w),
                        Text(message, style: theme.textTheme.labelMedium),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
