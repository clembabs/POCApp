import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_app/src/core/constants/app_routes.dart';
import 'package:poc_app/src/features/home/widgets/food_category_list.dart';
import 'package:poc_app/src/features/home/widgets/top_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => context.pushNamed(AppRoutes.foodDetails),
                  child: const HomeTopHeader(),
                ),
                // const HealthFoodList(),
                const FoodCategoryList(),
              ],
            ),
          ),
        ),
      );
}
