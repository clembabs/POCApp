import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_images.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';

class NoInternetView extends StatelessWidget {
  final bool useButton;
  const NoInternetView({super.key, this.useButton = false});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 270.h,
                width: double.infinity,
                child: Image.asset(AppImages.noInternet)),
            SizedBox(height: 8.h),
            Text(
              'NO INTERNET CONNECTION',
              style: AppTextStyles.buttonTextSemiBold
                  .copyWith(color: AppColors.primaryColor, fontSize: 18.sp),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: 341.w,
              // padding: EdgeInsets.symmetric(horizontal: 37.w),
              child: Text(
                'You don’t seem to have an active internet connection. Please check your connection.',
                style: AppTextStyles.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      );
}
