import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/core/themes/colors/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.secondaryLightColor,
    scaffoldBackgroundColor: AppColors.mainLightColor,
    cardTheme: CardThemeData(color: AppColors.mainLightColor, elevation: 0),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.mainLightColor,
      foregroundColor: AppColors.blackColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryLightColor,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors.mainLightColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1,
      backgroundColor: AppColors.mainLightColor,
      selectedIconTheme: IconThemeData(color: Color(0xffDDFFD6), size: 25.sp),
      selectedLabelStyle: TextStyle(fontSize: 15.sp),
      selectedItemColor: Colors.black,
      unselectedLabelStyle: TextStyle(fontSize: 15.sp),
      unselectedIconTheme: IconThemeData(
        color: AppColors.blackColor,
        size: 25.sp,
      ),
      unselectedItemColor: AppColors.blackColor,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: AppColors.blackColor),
      bodyLarge: TextStyle(color: AppColors.blackColor),
      bodySmall: TextStyle(color: AppColors.blackColor),
      displayMedium: TextStyle(color: AppColors.blackColor),
      displaySmall: TextStyle(color: AppColors.blackColor),
      displayLarge: TextStyle(color: AppColors.blackColor),
      headlineMedium: TextStyle(color: AppColors.blackColor),
      headlineSmall: TextStyle(color: AppColors.blackColor),
      headlineLarge: TextStyle(color: AppColors.blackColor),
      titleMedium: TextStyle(color: AppColors.blackColor),
      titleSmall: TextStyle(color: AppColors.blackColor),
      titleLarge: TextStyle(color: AppColors.blackColor),
      labelMedium: TextStyle(color: AppColors.blackColor),
      labelSmall: TextStyle(color: AppColors.blackColor),
      labelLarge: TextStyle(color: AppColors.grayColor),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.mainDarkColor,

    scaffoldBackgroundColor: AppColors.mainDarkColor,
    cardTheme: CardThemeData(color: AppColors.mainDarkColor, elevation: 0),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1,
      backgroundColor: AppColors.mainDarkColor,
      selectedIconTheme: IconThemeData(color: Color(0xffDDFFD6), size: 25.sp),
      selectedLabelStyle: TextStyle(fontSize: 15.sp),
      selectedItemColor:AppColors.mainLightColor,
      unselectedItemColor:AppColors.mainLightColor,
      unselectedLabelStyle: TextStyle(fontSize: 15.sp),
      unselectedIconTheme: IconThemeData(
        color: AppColors.mainLightColor,
        size: 25.sp,
      ),
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      showSelectedLabels: true,
    ),
    appBarTheme:  AppBarTheme(
      backgroundColor: AppColors.mainDarkColor,
      foregroundColor: AppColors.mainLightColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.mainLightColor,
      ),


    ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
  );
}
