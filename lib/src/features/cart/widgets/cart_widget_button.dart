import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartWidgetButton extends StatelessWidget {
  const CartWidgetButton(
      {Key? key, required this.onPressed, required this.child})
      : super(key: key);

  final VoidCallback onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          backgroundColor: Colors.white,
          minimumSize: Size(24.r, 24.r),
          shape: const CircleBorder(),
        ),
        onPressed: onPressed,
        child: child,
      );
}
