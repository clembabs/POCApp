import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: false,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 1,
        title: Text(title,
            style: AppTextStyles.displayThree.copyWith(fontSize: 20.sp)),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
