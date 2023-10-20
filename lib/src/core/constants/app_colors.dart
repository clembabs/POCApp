import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryColor = Color(0xFF4E06C2);
  static const Color yellow = Color(0xFFFFF500);
  static const Color white = Color(0xFFFFFFFF);

  static Gradient primaryColorGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF4D04C3),
      Color.fromRGBO(85, 14, 156, 0.85),
    ],
  );
}
