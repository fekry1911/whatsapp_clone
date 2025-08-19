import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/core/themes/colors/app_colors.dart';
import 'package:whatsapp_clone/featuers/chat/presentation/widgets/message.dart';

import '../data/rebo_message.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.name, required this.image});

  String? name;
  String? image;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          leadingWidth: 20.w,
          title: Row(
            children: [
              CircleAvatar(radius: 23.r, backgroundImage: NetworkImage(image!)),
              SizedBox(width: 10.w),
              Text(
                name!,
                overflow: TextOverflow.ellipsis,
                style: theme.appBarTheme.titleTextStyle?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                  color: isDark ? AppColors.mainLightColor : AppColors.blackColor,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.videocam_outlined, size: 23.r),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.call_outlined, size: 23.r),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, size: 23.r),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            isDark ? "assets/Whatsapp Chat Background.jpeg" : "assets/whatsapp.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 1.h,
            left: 12.w,
            right: 12.w,
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.emoji_emotions_outlined),
                        suffixIcon: Container(
                          width: 90.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.attach_file_outlined),
                              Icon(Icons.camera_alt_outlined),
                            ],
                          ),
                        ),
                        hintText: "Message",
                        fillColor: isDark
                            ? AppColors.mainDarkColor
                            : Colors.white.withOpacity(0.9),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  CircleAvatar(
                    radius: 25.r,
                    backgroundColor:AppColors.appBarChatLight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.mic_outlined,
                        size: 25.r,
                        color: AppColors.mainLightColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10.h,
            bottom: 70.h,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 150.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.mainDarkColor
                          : AppColors.mainLightColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Center(child: Text("December 12,2023"))],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h,),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final msg = messages[index];
                      return WhatsAppMessage(
                        message: msg.message,
                        isMe: msg.isMe,
                        isRead: msg.isRead,
                        time:
                        "${msg.time.hour.toString().padLeft(2, '0')}:${msg.time.minute.toString().padLeft(2, '0')}", // ممكن تضيف AM/PM لو تحب
                      );
                    },
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
