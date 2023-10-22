import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';
import 'package:poc_app/src/features/shared/widgets/action_button.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback nobuttonOnTap;
  final VoidCallback yesbuttonOnTap;
  final String? noText;
  final String? yesText;
  final String title;
  final String? description;
  const LogoutDialog({
    super.key,
    required this.nobuttonOnTap,
    required this.yesbuttonOnTap,
    this.noText,
    this.yesText,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) => Platform.isAndroid
      ? AlertDialog(
          titlePadding: EdgeInsets.zero,
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 16.h,
                    right: 3.w,
                    bottom: 10.h,
                  ),
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      size: 20,
                      color: AppColors.black.withOpacity(.5),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              color: AppColors.black.withOpacity(.5),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                bottom: 12.h,
              ),
              child: Text(
                title,
                style: AppTextStyles.headlineFour,
              ),
            ),
          ]),
          content: Text(description ?? 'Are you sure?',
              style: AppTextStyles.regular),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          actionsPadding: EdgeInsets.only(
            top: 26.h,
            bottom: 24.h,
            right: 13.w,
            left: 13.w,
          ),
          actions: [
            ActionButton(
              text: noText ?? 'No',
              onTap: nobuttonOnTap,
            ),
            ActionButton(
              text: yesText ?? 'Yes',
              onTap: yesbuttonOnTap,
              color: AppColors.errorColor,
            ),
          ],
        )
      : CupertinoAlertDialog(
          title: Text(
            title,
            style: AppTextStyles.headlineFour,
          ),
          content: Text(description ?? 'Are you sure?',
              style: AppTextStyles.regular),
          actions: [
            CupertinoDialogAction(
              onPressed: nobuttonOnTap,
              child: Text(
                noText ?? 'No',
              ),
            ),
            CupertinoDialogAction(
              onPressed: yesbuttonOnTap,
              child: Text(
                yesText ?? 'Yes',
              ),
            ),
          ],
        );

  void show(BuildContext context) => showDialog(
        context: context,
        builder: (_) => this,
      );
}
