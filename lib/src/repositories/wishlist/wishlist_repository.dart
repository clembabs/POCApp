import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_app/src/features/wishlist/models/wishlist.dart';
import 'package:poc_app/src/repositories/wishlist/wishlist_repository_impl.dart';
import 'package:poc_app/src/services/key_value_storage/key_value_storage_service.dart';

abstract class WishlistRepository {
  Future<List<Wishlist>> getWishlist();
  Future<String> addToWishlist({required Wishlist wishlist});
  Future<String> deleteFromWishlist({required Wishlist wishlist});
}

final wishlistRepositoryProvider = Provider<WishlistRepository>((ref) =>
    WishlistRepositoryImpl(
        storageService: ref.watch(keyValueStorageServiceProvider)));
