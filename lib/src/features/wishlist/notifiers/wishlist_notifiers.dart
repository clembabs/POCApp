import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poc_app/src/core/utilities/view_state.dart';
import 'package:poc_app/src/features/wishlist/models/wishlist.dart';
import 'package:poc_app/src/features/wishlist/states/wishlist_state.dart';
import 'package:poc_app/src/repositories/wishlist/wishlist_repository.dart';

class WishlistNotifier extends StateNotifier<WishlistState> {
  WishlistNotifier({required this.wishlistRepository})
      : super(WishlistState.initial()) {
    getWishlist();
  }
  final WishlistRepository wishlistRepository;

  Future<void> getWishlist() async {
    try {
      state = state.copyWith(viewState: ViewState.loading);
      final wishlist = await wishlistRepository.getWishlist();

      state = state.copyWith(
        wishlist: wishlist,
        viewState: ViewState.idle,
      );
    } on String catch (failure) {
      state = state.copyWith(failure: failure);
    }
  }

  Future<void> addToWishlist({required Wishlist wishlist}) async {
    try {
      state = state.copyWith(
        viewState: ViewState.loading,
        message: null,
      );
      final wishlistResp =
          await wishlistRepository.addToWishlist(wishlist: wishlist);

      state = state.copyWith(
        message: wishlistResp,
        viewState: ViewState.idle,
      );
      getWishlist();
    } on String catch (failure) {
      state = state.copyWith(failure: failure);
    }
  }

  Future<void> deleteFromWishlist({required Wishlist wishlist}) async {
    try {
      state = state.copyWith(
        viewState: ViewState.loading,
        message: null,
      );
      final wishlistResp =
          await wishlistRepository.deleteFromWishlist(wishlist: wishlist);

      state = state.copyWith(
        message: wishlistResp,
        viewState: ViewState.idle,
      );
      getWishlist();
    } on String catch (failure) {
      state = state.copyWith(failure: failure);
    }
  }
}

final wishlistNotifierProvider =
    StateNotifierProvider<WishlistNotifier, WishlistState>((ref) =>
        WishlistNotifier(
            wishlistRepository: ref.watch(wishlistRepositoryProvider)));
