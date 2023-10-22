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
}
