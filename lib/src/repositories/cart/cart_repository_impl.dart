import 'package:flutter/services.dart';
import 'package:poc_app/src/core/constants/storage_keys.dart';
import 'package:poc_app/src/features/cart/models/cart.dart';
import 'package:poc_app/src/features/shared/models/custom_error_response.dart';
import 'package:poc_app/src/repositories/cart/cart_repository.dart';
import 'package:poc_app/src/services/key_value_storage/key_value_storage_service.dart';

class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl({required this.storageService});

  final KeyValueStorageService storageService;

  @override
  Future<List<Cart>> getCart() async {
    try {
      var dataList = storageService.readList(key: StorageKeys.cartMap);
      final carts = dataList != null
          ? List<Cart>.from(
              dataList.map((json) {
                final cart = Cart.fromMap(json);
                return cart;
              }),
            )
          : <Cart>[];
      return carts;
    } on PlatformException {
      throw CustomErrorResponse(errors: [ErrorResponse(error: 'Error')]);
    }
  }

  @override
  Future<String> deleteFromCart({required Cart cart}) async {
    try {
      final dataList = storageService.readList(key: StorageKeys.cartMap) ??
          <Map<String, dynamic>>[];
      dataList.removeWhere((item) => item['id'] == cart.id);
      await storageService.saveList(
        key: StorageKeys.cartMap,
        value: dataList,
      );

      return 'Deleted';
    } on PlatformException {
      throw CustomErrorResponse(errors: [ErrorResponse(error: 'Error')]);
    }
  }

  @override
  Future<String> addToCart({required Cart cart}) async {
    try {
      final dataList = storageService.readList(key: StorageKeys.cartMap) ??
          <Map<String, dynamic>>[];

      dataList.add(cart.toMap());
      await storageService.saveList(
        key: StorageKeys.cartMap,
        value: dataList,
      );

      return 'Successful';
    } on PlatformException {
      throw CustomErrorResponse(errors: [ErrorResponse(error: 'Error')]);
    }
  }
}
