import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryColor = Color(0xFF4E06C2);
  static const Color yellow = Color(0xFFFFF500);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color darkGrey = Color(0xff979DA5);
  static const Color grey = Color(0xffC4C3C6);
  static const Color deepGrey = Color(0xffF2EEEE);
  static const Color successColor = Color(0xFF199425);

  static const Color errorColor = Color(0xFFCC0808);

  static Gradient primaryColorGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF4D04C3),
      Color.fromRGBO(85, 14, 156, 0.85),
    ],
  );
}
