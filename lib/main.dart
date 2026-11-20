import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'Screens/intro_screen.dart';
import 'Screens/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: key,
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(scaffoldBackgroundColor: AppColor.bac),
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      //locale: context.locale,
      home: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(300, 400),
        splitScreenMode: true,
        builder: (context, __) {
          return SplashScreen();
        },)
    );
  }
}
