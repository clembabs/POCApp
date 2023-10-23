enum FoodCategoryEnum {
  genericFoods,
  genericMeals,
  packagedFoods,
  fastFoods;

  String get label {
    switch (this) {
      case FoodCategoryEnum.genericFoods:
        return 'generic-foods';
      case FoodCategoryEnum.genericMeals:
        return 'generic-meals';
      case FoodCategoryEnum.packagedFoods:
        return 'packaged-foods';
      case FoodCategoryEnum.fastFoods:
        return 'fast-foods';
    }
  }

  String get title {
    switch (this) {
      case FoodCategoryEnum.genericFoods:
        return 'Generic Foods';
      case FoodCategoryEnum.genericMeals:
        return 'Generic Meals';
      case FoodCategoryEnum.packagedFoods:
        return 'Packaged Foods';
      case FoodCategoryEnum.fastFoods:
        return 'Fast Foods';
    }
  }
}
