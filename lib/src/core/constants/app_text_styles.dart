import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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

  static TextStyle button = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: Colors.black,
    fontSize: 20.sp,
  );
}
