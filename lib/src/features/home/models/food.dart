import 'package:poc_app/src/features/home/models/nutrients.dart';

class Food {
  final String? foodId;
  final String? label;
  final String? knownAs;
  final Nutrients? nutrients;
  final String? brand;
  final String? category;
  final String? categoryLabel;
  final String? foodContentsLabel;
  final String? image;

  Food({
    this.foodId,
    this.label,
    this.knownAs,
    this.nutrients,
    this.brand,
    this.category,
    this.categoryLabel,
    this.foodContentsLabel,
    this.image,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        foodId: json['foodId'],
        label: json['label'],
        knownAs: json['knownAs'],
        nutrients: json['nutrients'] == null
            ? null
            : Nutrients.fromJson(json['nutrients']),
        brand: json['brand'],
        category: json['category'],
        categoryLabel: json['categoryLabel'],
        foodContentsLabel: json['foodContentsLabel'],
        image: json['image'],
      );
}
