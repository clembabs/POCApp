import 'package:poc_app/src/core/utilities/view_state.dart';
import 'package:poc_app/src/features/wishlist/models/wishlist.dart';

class WishlistState {
  final ViewState viewState;

  final List<Wishlist>? wishlist;
  String? message;
  final String? failure;

  WishlistState._({
    this.viewState = ViewState.idle,
    this.wishlist,
    this.message,
    this.failure,
  });

  WishlistState.initial()
      : this._(
          wishlist: [],
        );

  WishlistState copyWith({
    List<Wishlist>? wishlist,
    ViewState? viewState,
    String? message,
    String? failure,
  }) =>
      WishlistState._(
        wishlist: wishlist ?? this.wishlist,
        viewState: viewState ?? this.viewState,
        message: message ?? this.message,
        failure: failure ?? this.failure,
      );
}
