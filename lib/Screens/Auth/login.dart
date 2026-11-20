import 'package:flutter/material.dart';
import 'package:do_it/Constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:do_it/Constants/app_colors.dart';
import 'package:do_it/CustomWidgets/app_button.dart';
import 'package:do_it/CustomWidgets/app_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';
import 'package:do_it/Screens/Auth/signup.dart';
import 'package:do_it/Screens/Auth/login_main.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColorMain,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
              child: SvgPicture.asset("assets/svg/blur_background.svg"),
            ),
          Padding(
              padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Spacer(),
              Image.asset("assets/images/logo.png"),
              AppText(
                text: "Be Organized.",
                fontSize: 32,
                textAlign: TextAlign.center,
                useSize: true,
                textHeight: 1.5,
                fontFamily: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                ).fontFamily,
                color: AppColor.intro3,
              ),
              AppText(
                text: "Start now.",
                fontSize: 20,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                ).fontFamily,
                useSize: true,
                color: AppColor.textColor,
              ),
              Spacer(),
              Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    text: "Sign in",
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_)=> LoginMain()));
                    },
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                  AppButton(
                    text: "Create Account",
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_)=> SignUp()));
                    },
                    backgroundColor: AppColor.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    textColor: AppColor.primaryColor,
                  ),
                ],
              ),
              Spacer(),
            ],
          ),)
          ],
        ),
      ),
    );
  }
}
