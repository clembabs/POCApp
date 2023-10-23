import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:poc_app/src/core/constants/api_routes.dart';
import 'package:poc_app/src/features/home/models/food_nutrition.dart';
import 'package:poc_app/src/features/shared/models/custom_error_response.dart';
import 'package:poc_app/src/repositories/food/food_repository.dart';
import 'package:poc_app/src/services/api_service.dart';
import 'package:poc_app/src/services/env_config.dart';
import 'package:poc_app/src/services/key_value_storage/key_value_storage_service.dart';

class FoodRepositoryImpl implements FoodRepository {
  FoodRepositoryImpl({
    required this.apiService,
    required this.storageService,
  });

  final KeyValueStorageService storageService;

  final ApiService apiService;

  @override
  Future<FoodNutrition> getFoods({
    int sessionCount = 20,
    String nutritionType = 'cooking',
    required String category,
  }) async {
    try {
      final client = apiService.client;
      final session = 'session=$sessionCount';
      const apiKeys = 'app_id=$edamamFoodAppId&app_key=$edamamFoodAppKey';
      final nutrition = 'nutrition-type=$nutritionType&category=$category';

      final response = await client
          .get('${ApiRoutes.foodDatabase}?$session&$apiKeys&$nutrition');

      final data = FoodNutrition.fromJson(response.data);
      return data;
    } on DioException catch (e) {
      throw CustomErrorResponse(errors: [ErrorResponse(error: e.message)]);
    } on PlatformException catch (e) {
      throw CustomErrorResponse(errors: [ErrorResponse(error: e.message)]);
    }
  }
}
