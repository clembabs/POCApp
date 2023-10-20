import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? color;
  final double? size;
  const LoadingIndicator({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.center,
        child: SpinKitChasingDots(
          color: color ?? AppColors.primaryColor,
          size: size ?? 50.0,
        ),
      );
}
