import 'dart:convert';

class Wishlist {
  final String id;
  final String image;
  final String name;
  final String price;
  final String description;
  final String brand;

  Wishlist({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.brand,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'image': image});
    result.addAll({'name': name});
    result.addAll({'price': price});
    result.addAll({'description': description});
    result.addAll({'brand': brand});

    return result;
  }

  factory Wishlist.fromMap(Map<String, dynamic> map) => Wishlist(
        id: map['id'] ?? '',
        image: map['image'] ?? '',
        name: map['name'] ?? '',
        price: map['price'] ?? '',
        description: map['description'] ?? '',
        brand: map['brand'] ?? '',
      );

  String toJson() => json.encode(toMap());

  factory Wishlist.fromJson(String source) =>
      Wishlist.fromMap(json.decode(source));
}
