import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/core/helpers/cache_helper.dart';
import 'package:whatsapp_clone/core/themes/colors/app_colors.dart';

import '../../chats/presentation/chats.dart';
import '../../stories/presentation/stories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.themeNotifier});

  final ValueNotifier<ThemeMode> themeNotifier;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<String> titles = ["WhatsApp", "Updates", "Communities", "calls"];
  List<Widget> screens=[ChatsScreen(),StoriesScreen(),ChatsScreen(),StoriesScreen(),];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: false,

      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(
          titles[index],
          style: index == 0
              ? theme.appBarTheme.titleTextStyle
              : theme.appBarTheme.titleTextStyle?.copyWith(
                  color: isDark?AppColors.mainLightColor:AppColors.blackColor,
                ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),

            child: Row(
              children: [
                index==0?IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt_outlined, size: 25.r),
                ):IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, size: 25.r),),
                PopupMenuButton<String>(
                  color: isDark
                      ? AppColors.mainDarkColor
                      : AppColors.mainLightColor,
                  icon: Icon(Icons.more_vert),
                  onSelected: (value) {
                    if (value == 'Change Theme') {
                      widget.themeNotifier.value = isDark
                          ? ThemeMode.light
                          : ThemeMode.dark;
                      isDark
                          ? CacheHelper.putBoolean(key: "dark", value: false)
                          : CacheHelper.putBoolean(key: "dark", value: true);
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'Change Theme',
                      child: Text(
                        'Change Theme',
                        style: TextStyle(
                          color: isDark
                              ? AppColors.mainLightColor
                              : AppColors.mainDarkColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        mouseCursor: MaterialStateMouseCursor.clickable,
        type: BottomNavigationBarType.fixed,
        elevation: 2,
        backgroundColor: Theme.of(
          context,
        ).bottomNavigationBarTheme.backgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: 90.w,
              height: 40.h,
              margin: EdgeInsets.only(bottom: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                shape: BoxShape.rectangle,
                color: index == 0 ? Color(0xff103629) : Colors.transparent,
              ),
              child: Center(child: Icon(Icons.chat)),
            ),
            label: "chats",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 90.w,
              height: 40.h,
              margin: EdgeInsets.only(bottom: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                shape: BoxShape.rectangle,
                color: index == 1 ? Color(0xff103629) : Colors.transparent,
              ),
              child: Icon(Icons.add_circle_outline),
            ),
            label: "Updates",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 90.w,
              height: 40.h,
              margin: EdgeInsets.only(bottom: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                shape: BoxShape.rectangle,
                color: index == 2 ? Color(0xff103629) : Colors.transparent,
              ),
              child: Icon(Icons.groups),
            ),

            label: "Communities",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 90.w,
              height: 40.h,
              margin: EdgeInsets.only(bottom: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                shape: BoxShape.rectangle,
                color: index == 3 ? Color(0xff103629) : Colors.transparent,
              ),
              child: Icon(Icons.call_sharp),
            ),
            label: "Calls",
          ),
        ],

        selectedIconTheme: Theme.of(
          context,
        ).bottomNavigationBarTheme.selectedIconTheme,
        unselectedIconTheme: Theme.of(
          context,
        ).bottomNavigationBarTheme.unselectedIconTheme,
        selectedLabelStyle: Theme.of(
          context,
        ).bottomNavigationBarTheme.selectedLabelStyle,
        unselectedLabelStyle: Theme.of(
          context,
        ).bottomNavigationBarTheme.unselectedLabelStyle,
        selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
      ),
    );
  }
}
