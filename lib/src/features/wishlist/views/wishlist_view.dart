import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';
import 'package:poc_app/src/features/cart/models/cart.dart';
import 'package:poc_app/src/features/cart/notifiers/cart_notifiers.dart';
import 'package:poc_app/src/features/cart/states/cart_state.dart';
import 'package:poc_app/src/features/shared/widgets/action_button.dart';
import 'package:poc_app/src/features/shared/widgets/custom_image_widget.dart';
import 'package:poc_app/src/features/shared/widgets/responsive_dialog.dart';
import 'package:poc_app/src/features/wishlist/notifiers/wishlist_notifiers.dart';
import 'package:poc_app/src/features/wishlist/states/wishlist_state.dart';
import 'package:poc_app/src/services/snack_bar_service.dart';

class WishlistView extends ConsumerWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistState = ref.watch(wishlistNotifierProvider);

    ref.listen<WishlistState>(
      wishlistNotifierProvider,
      (previous, next) async {
        if (next.failure != null) {
          context.loaderOverlay.hide();
          context.showErrorSnackBar('Error');
        }
        if (next.message != null) {
          context.loaderOverlay.hide();
          context.showSuccessSnackBar(next.message!);

          next.message = null;
        }
      },
    );

    ref.listen<CartState>(
      cartNotifierProvider,
      (previous, next) async {
        if (next.failure != null) {
          context.loaderOverlay.hide();
          context.showErrorSnackBar('Error');
        }
        if (next.message != null) {
          context.loaderOverlay.hide();
          context.showSuccessSnackBar(next.message!);

          next.message = null;
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 2,
        title: Text(
          'Wishlist',
          style: AppTextStyles.bodyOnePoppins,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (wishlistState.wishlist!.isEmpty)
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'No Favorite foods yet',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.displayThree,
                ),
              ),
            )
          else if (wishlistState.wishlist != [])
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                shrinkWrap: true,
                addAutomaticKeepAlives: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 300.h,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                ),
                itemCount: wishlistState.wishlist!.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                CustomImageWidget(
                                  imageUrl:
                                      wishlistState.wishlist![index].image,
                                  height: 150.h,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                // remove from wishlist
                                Positioned(
                                  top: 12.h,
                                  right: 0.w,
                                  child: GestureDetector(
                                    onTap: () {
                                      LogoutDialog(
                                              nobuttonOnTap: () =>
                                                  Navigator.pop(context),
                                              yesbuttonOnTap: () async {
                                                ref
                                                    .read(
                                                        wishlistNotifierProvider
                                                            .notifier)
                                                    .deleteFromWishlist(
                                                        wishlist: wishlistState
                                                            .wishlist![index]);
                                                Navigator.pop(context);
                                              },
                                              noText: 'Cancel',
                                              yesText: 'Delete',
                                              title: 'Delete?',
                                              description:
                                                  'Are you sure you want to remove this item from your wishlist')
                                          .show(context);
                                    },
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      maxRadius: 18,
                                      child: Center(
                                        child: Icon(
                                          Icons.favorite,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Divider(
                              thickness: 2,
                              height: 2,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              child: Text(
                                wishlistState.wishlist![index].name,
                                maxLines: 2,
                                style: AppTextStyles.bodyTwoPoppins,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Text(
                                wishlistState.wishlist![index].description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.bodyTwoPoppins
                                    .copyWith(fontSize: 13.sp),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: ActionButton(
                            text: 'Add to Cart',
                            borderRadius: 8,
                            onTap: () => ref
                                .read(cartNotifierProvider.notifier)
                                .addToCart(
                                    cart: Cart(
                                  id: wishlistState.wishlist![index].id,
                                  image: wishlistState.wishlist![index].image,
                                  name: wishlistState.wishlist![index].name,
                                  price: '30',
                                  description: wishlistState
                                      .wishlist![index].description,
                                  brand: wishlistState.wishlist![index].brand,
                                )),
                          ),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
