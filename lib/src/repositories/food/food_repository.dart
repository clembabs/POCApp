import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_app/src/features/home/models/food_nutrition.dart';
import 'package:poc_app/src/repositories/food/food_repository_impl.dart';
import 'package:poc_app/src/services/api_service.dart';

import '../../services/key_value_storage/key_value_storage_service.dart';

abstract class FoodRepository {
  Future<FoodNutrition> getFoods({
    int sessionCount = 40,
    String nutritionType = 'cooking',
    required String category,
  });
}

final foodRepositoryProvider = Provider<FoodRepository>(
  (ref) => FoodRepositoryImpl(
    storageService: ref.watch(keyValueStorageServiceProvider),
    apiService: ref.watch(apiServiceProvider),
  ),
);
