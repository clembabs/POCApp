import 'package:flutter/material.dart';
import 'package:poc_app/src/features/home/widgets/food_category_list.dart';
import 'package:poc_app/src/features/home/widgets/health_list.dart';
import 'package:poc_app/src/features/home/widgets/top_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HomeTopHeader(),
                HealthFoodList(),
                FoodCategoryList(),
              ],
            ),
          ),
        ),
      );
}
