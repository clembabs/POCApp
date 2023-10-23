import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poc_app/src/core/utilities/view_state.dart';
import 'package:poc_app/src/features/cart/models/cart.dart';
import 'package:poc_app/src/features/cart/states/cart_state.dart';
import 'package:poc_app/src/repositories/cart/cart_repository.dart';

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier({required this.cartRepository}) : super(CartState.initial()) {
    getCart();
  }
  final CartRepository cartRepository;

  Future<void> getCart() async {
    try {
      state = state.copyWith(viewState: ViewState.loading);
      final cart = await cartRepository.getCart();

      state = state.copyWith(
        cart: cart,
        viewState: ViewState.idle,
      );
    } on String catch (failure) {
      state = state.copyWith(failure: failure);
    }
  }

  Future<void> addToCart({required Cart cart}) async {
    try {
      state = state.copyWith(
        viewState: ViewState.loading,
        message: null,
      );
      final cartResp = await cartRepository.addToCart(cart: cart);

      state = state.copyWith(
        message: cartResp,
        viewState: ViewState.idle,
      );
      getCart();
    } on String catch (failure) {
      state = state.copyWith(failure: failure);
    }
  }

  Future<void> deleteFromCart({required Cart cart}) async {
    try {
      state = state.copyWith(
        viewState: ViewState.loading,
        message: null,
      );
      final cartResp = await cartRepository.deleteFromCart(cart: cart);

      state = state.copyWith(
        message: cartResp,
        viewState: ViewState.idle,
      );
      getCart();
    } on String catch (failure) {
      state = state.copyWith(failure: failure);
    }
  }
}

final cartNotifierProvider = StateNotifierProvider<CartNotifier, CartState>(
    (ref) => CartNotifier(cartRepository: ref.watch(cartRepositoryProvider)));
