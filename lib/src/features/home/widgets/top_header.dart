import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';

class HomeTopHeader extends StatelessWidget {
  const HomeTopHeader({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu',
              style: AppTextStyles.displayOne
                  .copyWith(color: AppColors.primaryColor),
            ),
            Text(
              'SnapBite - Feast The Essence',
              style: AppTextStyles.bodyOnePoppins
                  .copyWith(color: AppColors.grey, fontSize: 12.sp),
            )
          ],
        ),
      );
}
