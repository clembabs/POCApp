import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle displayOne = GoogleFonts.mochiyPopPOne(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: Colors.black,
    fontSize: 36.sp,
  );

  static TextStyle displayThree = GoogleFonts.mochiyPopPOne(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: Colors.black,
    fontSize: 24.sp,
  );

  static TextStyle bodyOnePoppins = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: Colors.black,
    fontSize: 24.sp,
  );

  static TextStyle bodyTwoPoppins = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: Colors.black,
    fontSize: 16.sp,
  );

  static TextStyle button = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: Colors.black,
    fontSize: 20.sp,
  );

  static TextStyle headlineFour = GoogleFonts.lato(
    fontWeight: FontWeight.w800,
    fontStyle: FontStyle.normal,
    color: AppColors.black,
    fontSize: 18.sp,
  );

  static TextStyle regular = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.black,
    fontSize: 14.sp,
  );

  static TextStyle mainCaption = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.black,
    fontSize: 14.sp,
  );
}
