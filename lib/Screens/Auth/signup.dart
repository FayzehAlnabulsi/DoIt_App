import 'package:flutter/material.dart';
import 'package:do_it/Constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:do_it/CustomWidgets/app_text_field.dart';
import 'package:do_it/CustomWidgets/app_text.dart';
import 'package:do_it/CustomWidgets/app_button.dart';
import 'package:do_it/Screens/Auth/login_main.dart';
import 'package:provider/provider.dart';
import '../../provider/provider_class.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:do_it/CustomWidgets/app_toaster.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final key = GlobalKey<FormState>();

  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool hide = true;
  bool hideConfirm = true;
  bool agree = false;

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
              child: Form(
                key: key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      controller: fullName,
                      validator: (v) {
                        return v == '' || v == null ? "Required Field" : null;
                      },
                      prefixIcon: Icon(
                        size: 22,
                        Icons.person_2_outlined,
                        color: AppColor.lightGrey,
                      ),
                    ),
                    AppTextField(
                      hint: "Email Address",
                      controller: email,
                      validator: (email) {
                        if (email!.isEmpty) {
                          return "Required Field";
                        }
                        if (EmailValidator.validate(email.trim()) == false) {
                          return "Invalid Email";
                        }
                        return null;
                      },
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: 22,
                        color: AppColor.lightGrey,
                      ),
                    ),
                    AppTextField(
                      hint: "Password",
                      controller: password,
                      validator: (pass) {
                        String pattern =
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                        RegExp regExp = RegExp(pattern);

                        if (pass!.isEmpty) {
                          return "Required Field";
                        }
                        if (pass.length < 8) {
                          return "Short Password";
                        }
                        if (!regExp.hasMatch(pass)) {
                          return "Invalid Password";
                        }
                        return null;
                      },
                      obscureText: hide,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            hide = !hide;
                          });
                        },
                        child: Icon(
                          hide
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined,
                          size: 22,
                          color: AppColor.lightGrey,
                        ),
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
                          controller: confirmPassword,
                          obscureText: hideConfirm,
                          fillColor: AppColor.white,
                          validator: (pass) {
                            String pattern =
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                            RegExp regExp = RegExp(pattern);

                            if (pass!.isEmpty) {
                              return "Required Field";
                            }
                            if (pass.length < 8) {
                              return "Short Password";
                            }
                            if (!regExp.hasMatch(pass)) {
                              return "Invalid Password";
                            }
                            return null;
                          },
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                hideConfirm = !hideConfirm;
                              });
                            },
                            child: Icon(
                              hideConfirm
                                  ? Icons.visibility_off_outlined
                                  : Icons.remove_red_eye_outlined,
                              size: 22,
                              color: AppColor.lightGrey,
                            ),
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
                              value: agree,
                              onChanged: (v) {
                                setState(() {
                                  agree = !agree;
                                });
                              },
                              activeColor: AppColor.secondaryColor,
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
                    Consumer<ProviderClass>(
                      builder: (BuildContext _, value, Widget? child) {
                        return AppButton(
                          text: "Sign up",
                          onPressed: () {
                            if (key.currentState!.validate() && agree) {
                              value
                                  .signUp(
                                    fullName: fullName.text,
                                    email: email.text,
                                    password: password.text,
                                  )
                                  .then((result) {
                                    result?.isSuccessful == true
                                        ? CustomToaster.show(
                                            context: context,
                                            message:
                                                result?.message?.toString() ??
                                                "Created successfully",
                                            isSuccess: true,
                                          )
                                        : CustomToaster.show(
                                            context: context,
                                            message:
                                                result?.message?.toString() ??
                                                "Something went wrong",
                                            isSuccess: false,
                                          );
                                  });
                            } else {
                              if (agree == false) {
                                CustomToaster.show(
                                  context: context,
                                  message:
                                      "Agree to terms and condition to create account",
                                  isSuccess: false,
                                );
                              }
                            }
                          },
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        );
                      },
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => LoginMain()),
                            );
                          },
                          child: AppText(
                            text: "Sign in",
                            fontSize: 12,
                            color: AppColor.primaryColor,
                            useSize: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
