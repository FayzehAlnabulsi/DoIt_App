import 'package:flutter/material.dart';
import 'package:do_it/Constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:do_it/CustomWidgets/app_text_field.dart';
import 'package:do_it/CustomWidgets/app_text.dart';
import 'package:do_it/CustomWidgets/app_button.dart';
import 'package:do_it/Screens/Auth/login_main.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColorMain,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/svg/sign_in_background.svg",
              fit: BoxFit.cover,
            ),
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
            Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 25),
                  AppText(
                    text: "Create Account",
                    color: AppColor.intro3,
                    fontSize: 20,
                    fontFamily: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                    ).fontFamily,
                    useSize: true,
                  ),
                  AppText(
                    text: "Fill in your details to get started",
                    fontSize: 14,
                    useSize: true,
                  ),
                  SizedBox(),
                  AppTextField(
                    hint: "Full Name",
                    controller: TextEditingController(),
                    validator: (v) {},
                    prefixIcon: Icon(
                      size: 22,
                      Icons.person_2_outlined,
                      color: AppColor.lightGrey,
                    ),
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
                  AppTextField(
                    hint: "Password",
                    controller: TextEditingController(),
                    validator: (v) {},
                    suffixIcon: Icon(
                      Icons.visibility_off_outlined,
                      size: 22,
                      color: AppColor.lightGrey,
                    ),
                    prefixIcon: UnconstrainedBox(
                      child: SvgPicture.asset(
                        height: 20,
                        width: 20,
                        "assets/svg/lock_icon.svg",
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      AppTextField(
                        hint: "Confirm Password",
                        controller: TextEditingController(),
                        validator: (v) {},
                        suffixIcon: Icon(
                          Icons.visibility_off_outlined,
                          size: 22,
                          color: AppColor.lightGrey,
                        ),
                        prefixIcon: UnconstrainedBox(
                          child: SvgPicture.asset(
                            height: 20,
                            width: 20,
                            "assets/svg/lock_icon.svg",
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (v) {},
                            side: BorderSide(color: AppColor.lightGrey),
                          ),
                          Transform.translate(
                            offset: Offset(-8, 0),
                            child: Row(
                              children: [
                                AppText(
                                  text: "I agree all the ",
                                  fontSize: 13,
                                  useSize: true,
                                ),
                                AppText(
                                  text: "terms",
                                  fontSize: 13,
                                  color: AppColor.primaryColor,
                                  useSize: true,
                                ),
                                AppText(
                                  text: " and ",
                                  fontSize: 13,
                                  useSize: true,
                                ),
                                AppText(
                                  text: "privacy Policy.",
                                  fontSize: 13,
                                  color: AppColor.primaryColor,
                                  useSize: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  AppButton(
                    text: "Sign up",
                    onPressed: () {},
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColor.lightGrey.withOpacity(.5),
                            height: 10,
                          ),
                        ),
                        AppText(
                          text: "Or continue with",
                          fontSize: 12,
                          useSize: true,
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColor.lightGrey.withOpacity(.5),
                            height: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppButton(
                    text: "Continue with google",
                    onPressed: () {},
                    fontFamily: GoogleFonts.cairo(
                      fontWeight: FontWeight.w600,
                    ).fontFamily,
                    backgroundColor: AppColor.white,
                    fontSize: 16,
                    textColor: AppColor.textColor,
                    icon: Image.asset(
                      height: 20,
                      width: 20,
                      "assets/images/google.png",
                    ),
                  ),
                  AppButton(
                    text: "Continue with apple",
                    onPressed: () {},
                    fontFamily: GoogleFonts.cairo(
                      fontWeight: FontWeight.w600,
                    ).fontFamily,
                    backgroundColor: AppColor.white,
                    fontSize: 16,
                    textColor: AppColor.textColor,
                    icon: Image.asset(
                      height: 20,
                      width: 20,
                      "assets/images/apple.png",
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      AppText(
                        text: "Already have an account?",
                        fontSize: 12,
                        useSize: true,
                      ),
                     InkWell(
                       onTap: (){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (_)=> LoginMain()));
                       },
                       child:  AppText(
                         text: "Sign in",
                         fontSize: 12,
                         color: AppColor.primaryColor,
                         useSize: true,
                       ),
                     )
                    ],
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
