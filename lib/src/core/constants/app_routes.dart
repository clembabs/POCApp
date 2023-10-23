import 'package:poc_app/src/features/home/views/food_category_list_view.dart';
import 'package:poc_app/src/features/home/views/food_details_view.dart';
import 'package:poc_app/src/features/home/views/food_list_view.dart';
import 'package:poc_app/src/features/root/views/root_view.dart';

class AppRoutes {
  AppRoutes._();
  static const String root = RootView.path;
  static const String foodCategory = FoodCategoryListView.path;
  static const String foodList = FoodListView.path;
  static const String foodDetails = FoodDetailsView.path;
}
