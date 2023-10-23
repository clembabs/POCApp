import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_routes.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';
import 'package:poc_app/src/features/home/models/food.dart';
import 'package:poc_app/src/features/home/models/food_nutrition.dart';
import 'package:poc_app/src/features/shared/widgets/custom_image_widget.dart';

class FoodList extends StatelessWidget {
  final FoodNutrition foodNutrition;
  const FoodList({
    super.key,
    required this.foodNutrition,
  });

  @override
  Widget build(BuildContext context) => Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: foodNutrition.hints!
                .map(
                  (food) => Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: InkWell(
                      onTap: () =>
                          context.pushNamed(AppRoutes.foodDetails, extra: {
                        'food': food.food,
                      }),
                      child: FoodCard(
                        foodCategory: food.food!,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );
}

class FoodCard extends StatelessWidget {
  final Food foodCategory;

  const FoodCard({super.key, required this.foodCategory});

  @override
  Widget build(BuildContext context) => Container(
        height: 110.h,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Card(
            shadowColor: Colors.black.withOpacity(0.2),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomImageWidget(
                      imageUrl: foodCategory.image ?? '',
                      width: 100.h,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          foodCategory.knownAs ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.regular.copyWith(
                              color: AppColors.black, fontSize: 14.sp),
                        ),
                      ),
                      Text(
                        foodCategory.brand ?? '',
                        style: AppTextStyles.bodyOnePoppins
                            .copyWith(color: AppColors.black, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
