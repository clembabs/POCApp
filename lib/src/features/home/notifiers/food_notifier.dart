import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poc_app/src/core/utilities/view_state.dart';
import 'package:poc_app/src/features/home/models/food_nutrition.dart';
import 'package:poc_app/src/features/home/states/food_state.dart';
import 'package:poc_app/src/features/shared/models/custom_error_response.dart';
import 'package:poc_app/src/repositories/food/food_repository.dart';

class FoodNotifier extends StateNotifier<FoodState> {
  FoodNotifier({
    required this.foodRepository,
  }) : super(FoodState.initial()) {
    getAllFoods();
  }

  final FoodRepository foodRepository;

  Future<void> getAllFoods({
    int sessionCount = 40,
    String? category,
  }) async {
    try {
      if (state.foodNutrition?.hints == [] || sessionCount == 40) {
        state = state.copyWith(viewState: ViewState.loading);
      }

      if (sessionCount > 40) {
        state = state.copyWith(paginatedViewState: ViewState.loading);
      }

      final foodNutrition = await foodRepository.getFoods(
        sessionCount: sessionCount,
        category: category!,
      );

      if (sessionCount == 40) {
        state = state.copyWith(
          foodNutrition: foodNutrition,
          viewState: ViewState.idle,
        );
      } else {
        state = state.copyWith(
          foodNutrition: FoodNutrition(
            hints: [...state.foodNutrition!.hints!, ...foodNutrition.hints!],
            links: foodNutrition.links,
          ),
          viewState: ViewState.idle,
          paginatedViewState: ViewState.idle,
        );
      }
    } on CustomErrorResponse catch (failure) {
      state = FoodState.error(failure: failure);
    }
  }
}

final foodNotifierProvider = StateNotifierProvider<FoodNotifier, FoodState>(
  (ref) => FoodNotifier(
    foodRepository: ref.watch(foodRepositoryProvider),
  ),
);
