import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';
import 'package:poc_app/src/core/utilities/view_state.dart';
import 'package:poc_app/src/features/home/notifiers/food_notifier.dart';
import 'package:poc_app/src/features/home/widgets/food_list.dart';
import 'package:poc_app/src/features/shared/widgets/custom_app_bar.dart';
import 'package:poc_app/src/features/shared/widgets/loading_indicator.dart';

class FoodListView extends ConsumerWidget {
  final String category;
  static const String path = 'food-list';
  const FoodListView({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodState = ref.watch(foodNotifierProvider);
    return Scaffold(
      appBar: CustomAppBar(title: category),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (foodState.viewState.isLoading)
                const LoadingIndicator()
              else if (foodState.foodNutrition?.hints == [])
                Text(
                  'No Foods available in this category',
                  style: AppTextStyles.displayThree,
                )
              else if (foodState.foodNutrition?.hints != [])
                FoodList(
                  foodNutrition: foodState.foodNutrition!,
                )
              else
                Text(
                  'An Error Occurred',
                  style: AppTextStyles.displayThree,
                )
            ],
          ),
        ),
      ),
    );
  }
}
