import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:do_it/Constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final bool? useSize;
  final TextDecoration? decoration;
  final TextOverflow? overFlow;
  final double? textHeight;
  final int? maxLines;
  final TextDirection? textDirection;

  const AppText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.textAlign,
    this.fontWeight,
    this.fontFamily,
    this.useSize,
    this.decoration,
    this.overFlow,
    this.textHeight,
    this.maxLines,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      textScaler: useSize == true
          ? null
          : TextScaler.linear(ScaleSize.textScaleFactor(context)),
      overflow: overFlow,
      maxLines: maxLines,
      textDirection: textDirection,
      style: TextStyle(
        color: color ?? AppColor.textColor,
        fontWeight: fontWeight,
        height: textHeight ?? 1,
        fontSize: useSize == true ? fontSize ?? 14.spMin : null,
        fontFamily: fontFamily ?? GoogleFonts.almarai().fontFamily,
        decoration: decoration,
        decorationColor: color,
      ),
    );
  }
}

class ScaleSize {
  static double textScaleFactor(
    BuildContext context, {
    double maxTextScaleFactor = 2,
  }) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
