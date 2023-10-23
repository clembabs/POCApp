import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_routes.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';
import 'package:poc_app/src/features/home/notifiers/food_notifier.dart';
import 'package:poc_app/src/features/shared/models/category_enums.dart';
import 'package:poc_app/src/features/shared/widgets/custom_image_widget.dart';

final List<FoodCategory> foodCategories = [
  FoodCategory(
    FoodCategoryEnum.packagedFoods.title,
    'https://www.edamam.com/food-img/c3f/c3f96d47d334b92f0120ff0b3a512ec3.jpg',
    FoodCategoryEnum.packagedFoods.label,
  ),
  FoodCategory(
    FoodCategoryEnum.genericMeals.title,
    'https://www.edamam.com/food-img/bea/bea10bb0afae1e498edadf0aa1be805e.jpg',
    FoodCategoryEnum.genericMeals.label,
  ),
  FoodCategory(
    FoodCategoryEnum.genericFoods.title,
    'https://www.edamam.com/food-img/49a/49a878702f9b654e1a965f2f2618a341.jpg',
    FoodCategoryEnum.genericFoods.label,
  ),
  FoodCategory(
    FoodCategoryEnum.fastFoods.title,
    'https://www.edamam.com/food-img/0f9/0f9f5f95df173e9ffaaff2977bef88f3.jpg',
    FoodCategoryEnum.fastFoods.label,
  ),
];

class FoodCategory {
  final String name;
  final String imageUrl;
  final String foodCategoryEnum;

  FoodCategory(
    this.name,
    this.imageUrl,
    this.foodCategoryEnum,
  );
}

class FoodCategoryList extends ConsumerWidget {
  const FoodCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: foodCategories
                    .map(
                      (food) => Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: InkWell(
                          onTap: () {
                            context.pushNamed(AppRoutes.foodList, extra: {
                              'category': food.name,
                            });
                            ref.read(foodNotifierProvider.notifier).getAllFoods(
                                  category: food.foodCategoryEnum,
                                );
                          },
                          child: FoodCard(
                            foodCategory: food,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
}

class FoodCard extends StatelessWidget {
  final FoodCategory foodCategory;

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
                      imageUrl: foodCategory.imageUrl,
                      width: 100.h,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    foodCategory.name,
                    maxLines: 2,
                    style: AppTextStyles.bodyOnePoppins
                        .copyWith(color: AppColors.black, fontSize: 20.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
