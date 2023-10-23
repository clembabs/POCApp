import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';
import 'package:poc_app/src/core/constants/svgs.dart';
import 'package:poc_app/src/core/utilities/platform_svg.dart';
import 'package:poc_app/src/features/cart/models/cart.dart';
import 'package:poc_app/src/features/cart/notifiers/cart_notifiers.dart';
import 'package:poc_app/src/features/cart/states/cart_state.dart';
import 'package:poc_app/src/features/cart/widgets/cart_widget_button.dart';
import 'package:poc_app/src/features/home/models/food.dart';
import 'package:poc_app/src/features/shared/widgets/action_button.dart';
import 'package:poc_app/src/features/shared/widgets/custom_image_widget.dart';
import 'package:poc_app/src/features/wishlist/models/wishlist.dart';
import 'package:poc_app/src/features/wishlist/notifiers/wishlist_notifiers.dart';
import 'package:poc_app/src/features/wishlist/states/wishlist_state.dart';
import 'package:poc_app/src/services/snack_bar_service.dart';

class FoodDetailsView extends ConsumerStatefulWidget {
  final Food food;
  static const String path = 'food-details';
  const FoodDetailsView({super.key, required this.food});

  @override
  ConsumerState<FoodDetailsView> createState() => _FoodDetailsViewState();
}

class _FoodDetailsViewState extends ConsumerState<FoodDetailsView> {
  late int _quantityCounter = 1;
  @override
  Widget build(BuildContext context) {
    final wishlistState = ref.watch(wishlistNotifierProvider);
    var wishlistProductIds = wishlistState.wishlist?.map((e) => e.id).toList();

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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: AppColors.white,
              // gradient: AppColors.primaryColorGradient
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: PlatformSvg.asset(SvgIcons.arrowLeftIcon,
                              color: AppColors.black)),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          if (wishlistState.wishlist?.any((element) =>
                                  wishlistProductIds!
                                      .contains(widget.food.foodId)) ==
                              false) {
                            ref
                                .read(wishlistNotifierProvider.notifier)
                                .addToWishlist(
                                    wishlist: Wishlist(
                                  id: widget.food.foodId!,
                                  image: widget.food.image ?? '',
                                  name: widget.food.knownAs ?? '',
                                  price: '30',
                                  description: widget.food.category ?? '',
                                  brand: widget.food.brand ?? '',
                                ));
                          } else {
                            ref
                                .read(wishlistNotifierProvider.notifier)
                                .deleteFromWishlist(
                                    wishlist: Wishlist(
                                  id: widget.food.foodId!,
                                  image: widget.food.image ?? '',
                                  name: widget.food.knownAs ?? '',
                                  price: '30',
                                  description: widget.food.category ?? '',
                                  brand: widget.food.brand ?? '',
                                ));
                          }
                        },
                        child: wishlistState.wishlist!.any((element) =>
                                wishlistProductIds!
                                    .contains(widget.food.foodId))
                            ? SvgPicture.asset(
                                SvgIcons.heartIconFilled,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.black,
                                  BlendMode.srcIn,
                                ),
                                height: 20.h,
                              )
                            : SvgPicture.asset(
                                SvgIcons.heartIcon,
                                width: 30.w,
                                color: AppColors.black,
                              ),
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                        padding: EdgeInsets.only(top: 50.h),
                        child: CustomImageWidget(
                          imageUrl: widget.food.image ?? '',
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 2.5,
                          fit: BoxFit.fill,
                        ))),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
                    height: MediaQuery.of(context).size.height / 1.7,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 280.w,
                                child: Text(
                                  widget.food.knownAs ?? '',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.bodyOnePoppins
                                      .copyWith(fontSize: 20.sp),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                r'$30',
                                style: AppTextStyles.bodyOnePoppins,
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            widget.food.category ?? '',
                            style: AppTextStyles.bodyOnePoppins
                                .copyWith(fontSize: 16.sp),
                          ),
                          Text(
                            widget.food.brand ?? '',
                            style: AppTextStyles.bodyOnePoppins
                                .copyWith(fontSize: 14.sp),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Quantity :',
                                      style: AppTextStyles.mainCaption,
                                    ),
                                    Flexible(
                                      child: CartWidgetButton(
                                        onPressed: () {
                                          setState(() {
                                            if (_quantityCounter > 1) {
                                              _quantityCounter--;
                                            }
                                          });
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: _quantityCounter == 1
                                              ? AppColors.grey
                                              : AppColors.black
                                                  .withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '$_quantityCounter',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Flexible(
                                      child: CartWidgetButton(
                                        onPressed: () {
                                          setState(() {
                                            _quantityCounter++;
                                          });
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color:
                                              AppColors.black.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // ),
                            ],
                          ),
                          SizedBox(height: 50.h),
                          ActionButton(
                            text: 'Add to Cart',
                            onTap: () => ref
                                .read(cartNotifierProvider.notifier)
                                .addToCart(
                                    cart: Cart(
                                  id: widget.food.foodId!,
                                  image: widget.food.image ?? '',
                                  name: widget.food.knownAs ?? '',
                                  price: '30',
                                  description: widget.food.category ?? '',
                                  brand: widget.food.brand ?? '',
                                  quantity: _quantityCounter,
                                )),
                          ),
                          SizedBox(height: 30.h)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
