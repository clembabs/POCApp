import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';
import 'package:poc_app/src/features/shared/widgets/action_button.dart';
import 'package:poc_app/src/features/shared/widgets/custom_image_widget.dart';
import 'package:poc_app/src/features/shared/widgets/responsive_dialog.dart';
import 'package:poc_app/src/features/wishlist/notifiers/wishlist_notifiers.dart';

class WishlistView extends ConsumerWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistState = ref.watch(wishlistNotifierProvider);

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (wishlistState.wishlist!.isEmpty)
              Text(
                'No Favourite Food yet',
                style: AppTextStyles.displayOne,
              )
            else if (wishlistState.wishlist != [])
              GridView.builder(
                shrinkWrap: true,
                addAutomaticKeepAlives: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 380.h,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 5,
                ),
                itemCount: wishlistState.wishlist!.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 1,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    CustomImageWidget(
                                      imageUrl:
                                          wishlistState.wishlist![index].image,
                                      height: 182.h,
                                      width: 182.w,
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
                                                                    .wishlist![
                                                                index]);
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
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.h),
                                  child: Text(
                                    wishlistState.wishlist![index].name,
                                    style: AppTextStyles.bodyTwoPoppins,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  wishlistState.wishlist![index].description,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.bodyTwoPoppins
                                      .copyWith(fontSize: 13.sp),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const ActionButton(text: 'Add to Cart')
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
