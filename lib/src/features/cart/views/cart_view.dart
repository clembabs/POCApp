import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';
import 'package:poc_app/src/features/cart/notifiers/cart_notifiers.dart';
import 'package:poc_app/src/features/cart/widgets/cart_item.dart';
import 'package:poc_app/src/features/shared/widgets/action_button.dart';
import 'package:poc_app/src/features/shared/widgets/responsive_dialog.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 2,
        title: Text(
          'Cart',
          style: AppTextStyles.bodyOnePoppins,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (cartState.cart!.isEmpty)
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'No Menu Food for delivery on cart yet',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.displayThree,
                ),
              ),
            )
          else if (cartState.cart != [])
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                addAutomaticKeepAlives: true,
                // Add plus one to the item count because of checkout button
                itemCount: cartState.cart!.length + 1,
                itemBuilder: (context, index) {
                  // This check ensures the checkout button is shown after
                  // the last item in the cart.
                  if (index == cartState.cart!.length) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            ActionButton(
                              text: 'Checkout',
                              width: double.infinity,
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return
                        // Container();
                        Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                      child: CartItem(
                        cartProduct: cartState.cart![index],
                        deleteOnTap: () {
                          LogoutDialog(
                                  nobuttonOnTap: () => Navigator.pop(context),
                                  yesbuttonOnTap: () async {
                                    ref
                                        .read(cartNotifierProvider.notifier)
                                        .deleteFromCart(
                                            cart: cartState.cart![index]);
                                    Navigator.pop(context);
                                  },
                                  noText: 'Cancel',
                                  yesText: 'Delete',
                                  title: 'Delete?',
                                  description:
                                      'Are you sure you want to remove this item from your cart?')
                              .show(context);
                        },
                        //image: imagesUrl[index],
                      ),
                    );
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}
