import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';

class ActionButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final TextStyle? style;
  final Widget? widget;
  final double? borderRadius;

  const ActionButton({
    Key? key,
    required this.text,
    this.onTap,
    this.width,
    this.height,
    this.color,
    this.widget,
    this.textColor,
    this.style,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 41.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color ?? AppColors.primaryColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 15),
          ),
          child: widget ??
              Text(
                text,
                style: style ??
                    AppTextStyles.button
                        .copyWith(color: textColor ?? AppColors.white),
              ),
        ),
      );
}
