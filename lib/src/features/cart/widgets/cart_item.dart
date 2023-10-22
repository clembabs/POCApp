import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';
import 'package:poc_app/src/core/constants/svgs.dart';
import 'package:poc_app/src/core/utilities/platform_svg.dart';
import 'package:poc_app/src/features/cart/models/cart.dart';
import 'package:poc_app/src/features/cart/widgets/cart_widget_button.dart';
import 'package:poc_app/src/features/shared/widgets/custom_image_widget.dart';

class CartItem extends ConsumerStatefulWidget {
  final Cart cartProduct;
  void Function()? deleteOnTap;

  CartItem({Key? key, required this.cartProduct, this.deleteOnTap})
      : super(key: key);

  @override
  ConsumerState createState() => _CartItemState();
}

class _CartItemState extends ConsumerState<CartItem>
    with AutomaticKeepAliveClientMixin {
  late int _quantityCounter = widget.cartProduct.quantity;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final value = NumberFormat('#,##0', 'en_US');

    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 0,
        child: Container(
          padding:
              EdgeInsets.only(top: 10.h, left: 10.w, bottom: 0.h, right: 10.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFE5E5E5),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.r),
                    child: CustomImageWidget(
                      height: 72.h,
                      width: 72.w,
                      imageUrl: widget.cartProduct.image,
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(width: 15.w),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.cartProduct.name} ',
                      style: AppTextStyles.mainCaption,
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
                                        : AppColors.black.withOpacity(0.5),
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
                                    color: AppColors.black.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                              onTap: widget.deleteOnTap,
                              child: PlatformSvg.asset(SvgIcons.deleteIcon,
                                  width: 20.w,
                                  height: 20.h,
                                  color: AppColors.grey)),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
