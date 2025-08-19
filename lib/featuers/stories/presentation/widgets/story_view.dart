import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/core/themes/colors/app_colors.dart';

import '../../data/model.dart';

class StoryViewer extends StatefulWidget {
  final List<StoryUser> users;
  final int initialUserIndex;

  const StoryViewer({
    super.key,
    required this.users,
    this.initialUserIndex = 0,
  });

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  late int currentUserIndex;
  int currentStoryIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    currentUserIndex = widget.initialUserIndex;
    startTimer();
  }

  void startTimer() {
    cancelTimer();
    final currentStory =
        widget.users[currentUserIndex].stories[currentStoryIndex];
    timer = Timer(currentStory.duration, nextStory);
  }

  void cancelTimer() {
    timer?.cancel();
  }

  void nextStory() {
    final user = widget.users[currentUserIndex];
    if (currentStoryIndex < user.stories.length - 1) {
      setState(() {
        currentStoryIndex++;
      });
      startTimer();
    } else {
      nextUser();
    }
  }

  void prevStory() {
    if (currentStoryIndex > 0) {
      setState(() {
        currentStoryIndex--;
      });
      startTimer();
    } else {
      prevUser();
    }
  }

  void nextUser() {
    if (currentUserIndex < widget.users.length - 1) {
      setState(() {
        currentUserIndex++;
        currentStoryIndex = 0;
      });
      startTimer();
    } else {
      Navigator.pop(context);
    }
  }

  void prevUser() {
    if (currentUserIndex > 0) {
      setState(() {
        currentUserIndex--;
        currentStoryIndex = 0;
      });
      startTimer();
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.users[currentUserIndex];
    final story = user.stories[currentStoryIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapUp: (details) {
          final width = MediaQuery.of(context).size.width;
          if (details.localPosition.dx < width / 2) {
            prevStory();
          } else {
            nextStory();
          }
        },
        child: Stack(
          children: [
            Positioned.fill(child: Image.network(story.url, fit: BoxFit.cover)),

            Positioned(
              top: 40.h,
              left: 10.w,
              right: 10.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress bars
                  Row(
                    children: user.stories
                        .asMap()
                        .map((i, s) {
                          return MapEntry(
                            i,
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 2.w),
                                height: 4.h,
                                decoration: BoxDecoration(
                                  color: i <= currentStoryIndex
                                      ? Colors.white
                                      : Colors.white24,
                                  borderRadius: BorderRadius.circular(2.r),
                                ),
                              ),
                            ),
                          );
                        })
                        .values
                        .toList(),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundImage: NetworkImage(user.profileImage),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        user.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.close)),
                    ],
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 20.h,
              left: 10.w,
              right: 10.w,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        fillColor: AppColors.mainDarkColor,
                        filled: true,
                        hintText: "Reply...",
                        hintStyle: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.sp,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide.none,
                        ),

                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),

                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: AppColors.mainDarkColor,
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        print("Added to favorites");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
