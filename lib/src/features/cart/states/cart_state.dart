import 'package:poc_app/src/core/utilities/view_state.dart';
import 'package:poc_app/src/features/cart/models/cart.dart';

class CartState {
  final ViewState viewState;

  final List<Cart>? cart;
  String? message;
  final String? failure;

  CartState._({
    this.viewState = ViewState.idle,
    this.cart,
    this.message,
    this.failure,
  });

  CartState.initial()
      : this._(
          cart: [],
        );

  CartState copyWith({
    List<Cart>? cart,
    ViewState? viewState,
    String? message,
    String? failure,
  }) =>
      CartState._(
        cart: cart ?? this.cart,
        viewState: viewState ?? this.viewState,
        message: message ?? this.message,
        failure: failure ?? this.failure,
      );
}
