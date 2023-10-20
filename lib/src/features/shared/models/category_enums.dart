enum FoodCategory {
  genericFoods,
  genericMeals,
  packagedFoods,
  fastFoods;

  String get label {
    switch (this) {
      case FoodCategory.genericFoods:
        return 'generic-foods';
      case FoodCategory.genericMeals:
        return 'generic-meals';
      case FoodCategory.packagedFoods:
        return 'packaged-foods';
      case FoodCategory.fastFoods:
        return 'fast-foods';
    }
  }
}
