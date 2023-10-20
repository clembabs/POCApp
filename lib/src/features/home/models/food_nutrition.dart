import 'package:poc_app/src/features/home/models/food.dart';
import 'package:poc_app/src/features/home/models/links.dart';

class FoodNutrition {
  final List<dynamic>? parsed;
  final List<Hint>? hints;
  final Links? links;

  FoodNutrition({
    this.parsed,
    this.hints,
    this.links,
  });

  factory FoodNutrition.fromJson(Map<String, dynamic> json) => FoodNutrition(
        parsed: json['parsed'] == null
            ? []
            : List<dynamic>.from(json['parsed']!.map((x) => x)),
        hints: json['hints'] == null
            ? []
            : List<Hint>.from(json['hints']!.map((x) => Hint.fromJson(x))),
        links: json['_links'] == null ? null : Links.fromJson(json['_links']),
      );
}

class Hint {
  final Food? food;

  Hint({
    this.food,
  });

  factory Hint.fromJson(Map<String, dynamic> json) => Hint(
        food: json['food'] == null ? null : Food.fromJson(json['food']),
      );
}
