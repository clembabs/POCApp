import 'package:flutter/material.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';

extension SnackbarExtension on BuildContext {
  void showSuccessSnackBar(
    String text,
  ) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.successColor,
        content: Text(
          text,
          style: AppTextStyles.regular.copyWith(color: AppColors.white),
        ),
      ),
    );
  }

  void showErrorSnackBar(
    String text,
  ) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          text,
          style: AppTextStyles.regular.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
