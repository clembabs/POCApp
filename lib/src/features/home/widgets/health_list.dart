import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';
import 'package:poc_app/src/features/shared/widgets/custom_image_widget.dart';

class Product {
  final int id;
  final String name;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.image,
  });
}

List<Product> sampleProducts = [
  Product(
    id: 1,
    name: 'Pizza',
    image:
        'https://www.edamam.com/food-img/e9c/e9c05af94acdd898c41532476783f236.jpg',
  ),
  Product(
    id: 2,
    name: 'Burger',
    image:
        'https://www.edamam.com/food-img/e9c/e9c05af94acdd898c41532476783f236.jpg',
  ),
  Product(
    id: 3,
    name: 'Desert',
    image:
        'https://www.edamam.com/food-img/e9c/e9c05af94acdd898c41532476783f236.jpg',
  ),
  Product(
    id: 4,
    name: 'Ice Cream',
    image:
        'https://www.edamam.com/food-img/e9c/e9c05af94acdd898c41532476783f236.jpg',
  ),
  Product(
    id: 5,
    name: 'Chips',
    image:
        'https://www.edamam.com/food-img/e9c/e9c05af94acdd898c41532476783f236.jpg',
  ),
  Product(
    id: 6,
    name: 'Money',
    image:
        'https://www.edamam.com/food-img/e9c/e9c05af94acdd898c41532476783f236.jpg',
  ),
];

class HealthFoodList extends StatelessWidget {
  const HealthFoodList({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: sampleProducts
                      .map(
                        (product) => Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: _HealthListItem(
                            onTap: () {},
                            imageUrl: product.image,
                            productName: product.name,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      );
}

class _HealthListItem extends StatelessWidget {
  final String imageUrl;
  final Function()? onTap;
  final String productName;
  const _HealthListItem({
    required this.imageUrl,
    required this.onTap,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: 70.w,
              height: 70.h,
              decoration: const BoxDecoration(
                color: AppColors.deepGrey,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CustomImageWidget(
                  width: 70.w,
                  height: 70.h,
                  imageUrl: imageUrl,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              alignment: Alignment.center,
              width: 60.w,
              child: Text(
                productName,
                maxLines: 2,
                style: AppTextStyles.bodyOnePoppins
                    .copyWith(color: AppColors.black, fontSize: 10.sp),
              ),
            ),
          ],
        ),
      );
}
