import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_routes.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';

final List<FoodCategory> foodCategories = [
  FoodCategory('Packaged Foods',
      'https://www.edamam.com/food-img/c3f/c3f96d47d334b92f0120ff0b3a512ec3.jpg'),
  FoodCategory('Generic Meals',
      'https://www.edamam.com/food-img/bea/bea10bb0afae1e498edadf0aa1be805e.jpg'),
  FoodCategory('Generic Food',
      'https://www.edamam.com/food-img/49a/49a878702f9b654e1a965f2f2618a341.jpg'),
  FoodCategory('Fast Food',
      'https://www.edamam.com/food-img/0f9/0f9f5f95df173e9ffaaff2977bef88f3.jpg'),
];

class FoodCategory {
  final String name;
  final String imageUrl;

  FoodCategory(this.name, this.imageUrl);
}

class FoodCategoryList extends StatelessWidget {
  const FoodCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
              //   child: Text(
              //     'Food Category',
              //     style: AppTextStyles.displayOne
              //         .copyWith(color: AppColors.primaryColor, fontSize: 20.sp),
              //   ),
              // ),
              Column(
                children: foodCategories
                    .map(
                      (food) => Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: GestureDetector(
                          onTap: () =>
                              context.pushNamed(AppRoutes.foodCategory),
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
                    child: Image.network(
                      foodCategory.imageUrl,
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
