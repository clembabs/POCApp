import 'package:flutter/material.dart';
import 'package:poc_app/src/features/home/widgets/food_category_list.dart';
import 'package:poc_app/src/features/shared/widgets/custom_app_bar.dart';

class FoodCategoryListView extends StatelessWidget {
  static const String path = 'food-category';
  const FoodCategoryListView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomAppBar(title: 'Packaged Foods'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                FoodCategoryList(),
              ],
            ),
          ),
        ),
      );
}
