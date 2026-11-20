import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:do_it/Constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:do_it/CustomWidgets/app_button.dart';
import 'package:do_it/CustomWidgets/app_text.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final Function()? onTap;
  final Color? borderColor;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextAlign? textAlign;
  final FormFieldValidator<String>? validator;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatter;
  final int? radius;
  final int? minLines;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  final bool? enabled;
  const AppTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.validator,
    this.onSubmit,
    this.borderColor,
    this.fillColor,
    this.onChange,
    this.suffixIcon,
    this.prefixIcon,
    this.textAlign,
    this.obscureText,
    this.inputFormatter,
    this.radius,
    this.minLines,
    this.maxLines,
    this.onTap,
    this.contentPadding,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(
        context,
      ).copyWith(textScaler: TextScaler.linear(0.90)), // Scales text by 1.5
      child: TextFormField(
        controller: controller,
        onFieldSubmitted: onSubmit,
        validator: validator,
        minLines: minLines ?? 1,
        maxLines: maxLines ?? 1,
        obscureText: obscureText ?? false,
        onTap: onTap,
        enabled: enabled,
        style: TextStyle(
          color: AppColor.textColor,
          fontSize: 7.h,
          fontFamily: GoogleFonts.almarai().fontFamily,
        ),
        textAlign: textAlign ?? TextAlign.start,
        onChanged: onChange ?? (value) {},
        inputFormatters: inputFormatter,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          isDense: true,
          hintStyle: TextStyle(
            color: AppColor.textColor.withOpacity(0.5),
            fontSize: 7.h,
            fontFamily: GoogleFonts.almarai().fontFamily,
          ),
          labelStyle: TextStyle(
            color: AppColor.textColor,
            fontSize: 7.h,
            fontFamily: GoogleFonts.almarai().fontFamily,
          ),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              radius != null ? double.parse('$radius') : 20,
            ),
            borderSide: BorderSide(
              color: borderColor ?? AppColor.lightGrey,
              width: 0.50,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              radius != null ? double.parse('$radius') : 20,
            ),
            borderSide: BorderSide(color: AppColor.lightGrey, width: 0.50),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              radius != null ? double.parse('$radius') : 20,
            ),
            borderSide: BorderSide(
              color: borderColor ?? AppColor.lightGrey,
              width: 0.50,
            ),
          ),
          fillColor: fillColor ?? AppColor.backgroundColorMain,
          contentPadding:
              contentPadding ??
              EdgeInsets.only(
                right: 10.spMin,
                left: 10.spMin,
                top: 15.spMin,
                bottom: 15.spMin,
              ),
          filled: true,
        ),
      ),
    );
  }
}
