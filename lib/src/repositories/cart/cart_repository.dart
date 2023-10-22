import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_app/src/features/cart/models/cart.dart';
import 'package:poc_app/src/repositories/cart/cart_repository_impl.dart';
import 'package:poc_app/src/services/key_value_storage/key_value_storage_service.dart';

abstract class CartRepository {
  Future<List<Cart>> getCart();
  Future<String> addToCart({required Cart cart});
  Future<String> deleteFromCart({required Cart cart});
}

final cartRepositoryProvider = Provider<CartRepository>((ref) =>
    CartRepositoryImpl(
        storageService: ref.watch(keyValueStorageServiceProvider)));
