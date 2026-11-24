import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'Screens/intro_screen.dart';
import 'Screens/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:do_it/provider/provider_class.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ProviderClass())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: key,
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(300, 400),
        splitScreenMode: true,
        builder: (context, __) {
          return SplashScreen();
        },
      ),
    );
  }
}
