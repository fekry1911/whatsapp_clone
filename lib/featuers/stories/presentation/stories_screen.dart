import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/featuers/chats/data/rebo/fake_data.dart';
import 'package:whatsapp_clone/featuers/stories/presentation/widgets/story_design.dart';
import 'package:whatsapp_clone/featuers/stories/presentation/widgets/story_view.dart';

import '../../../core/themes/colors/app_colors.dart';
import '../../../core/widgets/user_card.dart';
import '../data/rebo.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.all(12.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Status",
              style: theme.textTheme.labelLarge?.copyWith(
                fontSize: 24.sp,
                color: isDark ? AppColors.mainLightColor : AppColors.blackColor,
              ),
            ),
            SizedBox(height: 8.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                    elevation: isDark ? 9 : 2,
                    child: Container(
                      height: 150.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                backgroundColor: isDark
                                    ? AppColors.mainDarkColor
                                    : AppColors.mainLightColor,

                                radius: 37.r,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.mainDarkColor,

                                  radius: 35.r,
                                  backgroundImage: NetworkImage(
                                    "https://picsum.photos/200",
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: AppColors.appBarChatLight,
                                radius: 15.r,
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.mainLightColor,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text("Add Status"),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  ...List.generate(fakeChats.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                StoryViewer(users: fakeStoryUsers),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: StoryDesign(
                          image: fakeChats[index].imageUrl,
                          name: fakeChats[index].name,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Channels",
              style: theme.textTheme.labelLarge?.copyWith(
                fontSize: 24.sp,
                color: isDark ? AppColors.mainLightColor : AppColors.blackColor,
              ),
            ),
            SizedBox(height: 10.h),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 13,
              itemBuilder: (BuildContext context, int index) {
                return UserCard(
                  name: fakeChats[index].name,
                  time: fakeChats[index].time,
                  imageUrl: fakeChats[index].imageUrl,
                  isMe: fakeChats[index].isMe,
                  isRead: fakeChats[index].isRead,
                  message: fakeChats[index].message,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
