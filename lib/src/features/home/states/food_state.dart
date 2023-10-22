import 'package:poc_app/src/core/utilities/view_state.dart';
import 'package:poc_app/src/features/home/models/food_nutrition.dart';
import 'package:poc_app/src/features/shared/models/custom_error_response.dart';

class FoodState {
  final ViewState viewState;
  final ViewState paginatedViewState;

  final FoodNutrition? foodNutrition;

  String? message;
  final CustomErrorResponse? failure;

  FoodState._({
    required this.viewState,
    this.paginatedViewState = ViewState.idle,
    this.message,
    this.foodNutrition,
    this.failure,
  });

  factory FoodState.initial() => FoodState._(
        viewState: ViewState.idle,
        message: null,
        foodNutrition: FoodNutrition(),
      );

  FoodState.error({
    required CustomErrorResponse failure,
  }) : this._(
          viewState: ViewState.idle,
          failure: failure,
          foodNutrition: FoodNutrition(),
        );

  FoodState copyWith({
    ViewState? viewState,
    ViewState? paginatedViewState,
    FoodNutrition? foodNutrition,
    String? message,
    CustomErrorResponse? failure,
  }) =>
      FoodState._(
        viewState: viewState ?? this.viewState,
        paginatedViewState: paginatedViewState ?? this.paginatedViewState,
        message: message ?? this.message,
        failure: failure ?? failure,
        foodNutrition: foodNutrition ?? this.foodNutrition,
      );
}
