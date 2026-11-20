import 'package:flutter/material.dart';
import 'package:do_it/Constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:do_it/CustomWidgets/app_text_field.dart';
import 'package:do_it/CustomWidgets/app_text.dart';
import 'package:do_it/CustomWidgets/app_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColorMain,
      body: Stack(
        children: [
          Positioned(
            top: 60,
            left: 30,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: AppColor.darkGray),
            ),
          ),
          Padding(padding: EdgeInsets.all(20),
          child: Column(
            spacing: 25,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/forgot_pass.png',
                  width: 210,
                  height: 206,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(),
              AppText(
                text: "Forgot Password?",
                color: AppColor.intro3,
                fontSize: 20,
                fontFamily: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                ).fontFamily,
                useSize: true,
              ),
              AppText(
                text: "Enter your email and we’ll send you an OTP.",
                fontSize: 14,
                useSize: true,
              ),
              AppTextField(
                hint: "Email Address",
                controller: TextEditingController(),
                validator: (v) {},
                prefixIcon: Icon(
                  Icons.email_outlined,
                  size: 22,
                  color: AppColor.lightGrey,
                ),
              ),
              AppButton(
                text: "Send",
                onPressed: () {},
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ],),)
        ],
      ),
    );
  }
}
