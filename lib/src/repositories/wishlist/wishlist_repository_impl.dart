import 'package:flutter/services.dart';
import 'package:poc_app/src/core/constants/storage_keys.dart';
import 'package:poc_app/src/features/shared/models/custom_error_response.dart';
import 'package:poc_app/src/features/wishlist/models/wishlist.dart';
import 'package:poc_app/src/repositories/wishlist/wishlist_repository.dart';
import 'package:poc_app/src/services/key_value_storage/key_value_storage_service.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  WishlistRepositoryImpl({required this.storageService});

  final KeyValueStorageService storageService;

  @override
  Future<List<Wishlist>> getWishlist() async {
    try {
      var dataList = storageService.readList(key: StorageKeys.wishlistMap);
      final wishlists = dataList != null
          ? List<Wishlist>.from(
              dataList.map((json) {
                final wishlist = Wishlist.fromMap(json);
                return wishlist;
              }),
            )
          : <Wishlist>[];
      return wishlists;
    } on PlatformException {
      throw CustomErrorResponse(errors: [ErrorResponse(error: 'Error')]);
    }
  }

  @override
  Future<String> deleteFromWishlist({required Wishlist wishlist}) async {
    try {
      final dataList = storageService.readList(key: StorageKeys.wishlistMap) ??
          <Map<String, dynamic>>[];
      dataList.removeWhere((item) => item['id'] == wishlist.id);
      await storageService.saveList(
        key: StorageKeys.wishlistMap,
        value: dataList,
      );

      return 'Deleted';
    } on PlatformException {
      throw CustomErrorResponse(errors: [ErrorResponse(error: 'Error')]);
    }
  }

  @override
  Future<String> addToWishlist({required Wishlist wishlist}) async {
    try {
      final dataList = storageService.readList(key: StorageKeys.wishlistMap) ??
          <Map<String, dynamic>>[];

      dataList.add(wishlist.toMap());
      await storageService.saveList(
        key: StorageKeys.wishlistMap,
        value: dataList,
      );

      return 'Successful';
    } on PlatformException {
      throw CustomErrorResponse(errors: [ErrorResponse(error: 'Error')]);
    }
  }
}
