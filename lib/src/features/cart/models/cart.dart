import 'dart:convert';

class Cart {
  final int id;
  final String image;
  final String name;
  final String price;
  final String description;
  final int quantity;

  Cart({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'image': image});
    result.addAll({'name': name});
    result.addAll({'price': price});
    result.addAll({'description': description});
    result.addAll({'quantity': quantity});

    return result;
  }

  factory Cart.fromMap(Map<String, dynamic> map) => Cart(
        id: map['id']?.toInt() ?? 0,
        image: map['image'] ?? '',
        name: map['name'] ?? '',
        price: map['price'] ?? '',
        description: map['description'] ?? '',
        quantity: map['quantity'] ?? 1,
      );

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));
}
