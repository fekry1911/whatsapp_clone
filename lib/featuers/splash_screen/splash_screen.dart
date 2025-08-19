import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/core/themes/colors/app_colors.dart';

import '../home/presentation/home.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key,required this.themeNotifier});
  final ValueNotifier<ThemeMode> themeNotifier;


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

  Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(themeNotifier: widget.themeNotifier,),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:AppColors.mainDarkColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.all(20.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Image.asset(
                  "assets/whatsapp-xxl.png",
                  width: 100.w,
                  height: 100.h,
                ),
                Spacer(),
                Text("from",style: TextStyle(color: AppColors.grayColor),),
                //SizedBox(height: 5.h,),
                Image.asset("assets/meta.png",height: 70.h,width: 70.h,),
                
        
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
