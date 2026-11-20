import 'dart:ui';
import 'package:flutter/material.dart';

class AppColor{

  static Color get noColor => Colors.transparent;
  static Color get backgroundColor => const Color(0xFFDFE9F2);
  static Color get backgroundColorMain => const Color(0xFFFBFCF7);
  static Color get white => const Color(0xFFFFFFFF);
  static Color get black => const Color(0xFF000000);
  static Color get textColor => const Color(0xFF43433E);
  static Color get darkGray => const Color(0xFF626262);
  static Color get lightGrey => const Color(0xFF92937F);
  static Color get primaryColor => const Color(0xFF5280B2);
  static Color get secondaryColor => const Color(0xFFD0E54A);
  static Color get secondaryBlue => const Color(0xFFDBE2E8);
  static Color get success => const Color(0xFFEEFCF0);
  static Color get failure => const Color(0xFFF8E8E8);

  ///status color========================================
  static Color get toDoStatus => const Color(0xFF8A38F5);//
  static Color get inProgressStatus => Color(0xFFF98C2D);
  static Color get doneStatus => const Color(0xFF56D72E);

  ///priority color========================================
  static Color get mediumPriority => Color(0xFFF98C2D);
  static Color get lowPriority => const Color(0xFF56D72E);
  static Color get highPriority => const Color(0xFFF01818);

  ///intro colors =========================================
  static Color get intro1 => const Color(0xFF63B79E);
  static Color get intro2 => const Color(0xFF67ADC0);
  static Color get intro3 => const Color(0xFF1C3B69);
}