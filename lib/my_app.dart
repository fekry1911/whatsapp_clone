import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/core/helpers/cache_helper.dart';

import 'core/themes/dark_light.dart';
import 'featuers/home/presentation/home.dart';
import 'featuers/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
   getTheme(){
    bool? isDark=CacheHelper.getBoolean(key: "dark");
    if(isDark==false || isDark==null){
      themeNotifier.value=ThemeMode.light;
    }
    else{
      themeNotifier.value=ThemeMode.dark;
    }

  }

  @override
  Widget build(BuildContext context) {
    getTheme();
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: themeNotifier,
          builder: (BuildContext context, ThemeMode value, Widget? child) {
            return MaterialApp(
              title: 'WhatsApp Clone',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: value,
              home: SplashScreen(themeNotifier: themeNotifier),
            );
          },
        );
      },
    );
  }
}
