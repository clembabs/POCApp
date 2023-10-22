import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_images.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';
import 'package:poc_app/src/core/constants/svgs.dart';
import 'package:poc_app/src/core/utilities/platform_svg.dart';
import 'package:poc_app/src/features/shared/widgets/action_button.dart';

class FoodDetailsView extends StatelessWidget {
  static const String path = 'food-details';
  const FoodDetailsView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(gradient: AppColors.primaryColorGradient),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60.h, left: 25.w, right: 25.w),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: PlatformSvg.asset(SvgIcons.arrowLeftIcon)),
                      const Spacer(),
                      SvgPicture.asset(
                        SvgIcons.heartIcon,
                        width: 30.w,
                        height: 30.h,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: Image.asset(
                        AppImages.grillChicken,
                      ),
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
                    height: MediaQuery.of(context).size.height / 1.7,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Beef Burger',
                                style: AppTextStyles.bodyOnePoppins,
                              ),
                              const Spacer(),
                              Text(
                                r'$30',
                                style: AppTextStyles.bodyOnePoppins,
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'nhbfhjbjvfnvn hsdhh dhhd  dhhbd hdbh  dhhd ',
                            style: AppTextStyles.bodyOnePoppins
                                .copyWith(fontSize: 18.sp),
                          ),
                          const Spacer(),
                          const ActionButton(text: 'Add to Cart'),
                          SizedBox(height: 30.h)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
