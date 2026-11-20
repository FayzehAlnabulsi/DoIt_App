import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:do_it/Constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:do_it/CustomWidgets/app_text.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? backgroundColor;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final double? radius;
  final Color? borderColor;
  final Color? textColor;
  final Size? size;
  final Widget? icon;
  final String? fontFamily;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize,
    this.textAlign,
    this.fontWeight,
    this.borderColor,
    this.size,
    this.backgroundColor,
    this.radius,
    this.textColor,
    this.icon,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: MaterialStateProperty.resolveWith<BorderSide?>((
          Set<MaterialState> states,
        ) {
          return BorderSide(color: borderColor ?? AppColor.primaryColor);
        }),
        elevation: MaterialStateProperty.all(6),
        shadowColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.6)),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>((
          Set<MaterialState> states,
        ) {
          return backgroundColor ?? AppColor.primaryColor; // default
        }),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>((
          Set<MaterialState> states,
        ) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 20),
            side: BorderSide(color: borderColor ?? AppColor.primaryColor),
          );
        }),
        fixedSize: MaterialStateProperty.resolveWith<Size?>((
          Set<MaterialState> states,
        ) {
          return size ?? Size(double.infinity, 22.h);
        }),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.spMin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon != null
                ? Padding(padding: EdgeInsets.only(right: 10), child: icon!)
                : SizedBox(),
            AppText(
              text: text,
              color: textColor ?? AppColor.white,
              fontWeight: fontWeight,
              fontFamily:
                  fontFamily ??
                  GoogleFonts.cairo(fontWeight: FontWeight.w700).fontFamily,
              useSize: fontSize != null,
              fontSize: fontSize ?? 14.spMin,
            ),
          ],
        ),
      ),
    );
  }
}
