import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';
import 'package:poc_app/src/core/constants/svgs.dart';
import 'package:poc_app/src/core/utilities/platform_svg.dart';
import 'package:poc_app/src/features/cart/notifiers/cart_notifiers.dart';
import 'package:poc_app/src/features/wishlist/notifiers/wishlist_notifiers.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    this.onTap,
    this.currentIndex = 0,
  }) : super(key: key);

  final int currentIndex;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    const bottomNavigationItem = [
      BottomNavigationBarItem(
        icon: _BottomNavIcon(
          iconPath: SvgIcons.homeInactiveIcon,
          color: AppColors.darkGrey,
        ),
        activeIcon: _BottomNavIcon(
          iconPath: SvgIcons.homeActiveIcon,
          color: AppColors.primaryColor,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: _BottomNavIcon(
          iconPath: SvgIcons.favouriteInactiveIcon,
          color: AppColors.darkGrey,
          hasNoBadge: false,
          badgeWidget: _WishlistBadgeConsumer(
            AppColors.primaryColor,
            AppColors.white,
          ),
        ),
        activeIcon: _BottomNavIcon(
          iconPath: SvgIcons.favouriteActiveIcon,
          color: AppColors.primaryColor,
          hasNoBadge: false,
          badgeWidget: _WishlistBadgeConsumer(
            AppColors.yellow,
            AppColors.black,
          ),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: _BottomNavIcon(
          iconPath: SvgIcons.cartInactiveIcon,
          color: AppColors.darkGrey,
          hasNoBadge: false,
          badgeWidget: _CartBadgeConsumer(
            AppColors.primaryColor,
            AppColors.white,
          ),
        ),
        activeIcon: _BottomNavIcon(
          iconPath: SvgIcons.cartActiveIcon,
          color: AppColors.primaryColor,
          hasNoBadge: false,
          badgeWidget: _CartBadgeConsumer(
            AppColors.yellow,
            AppColors.black,
          ),
        ),
        label: '',
      ),
    ];

    return SizedBox(
      height: 80.h,
      child: Platform.isIOS
          ? CupertinoTabBar(
              backgroundColor: Colors.white,
              activeColor: AppColors.primaryColor,
              inactiveColor: AppColors.darkGrey,
              onTap: onTap,
              iconSize: 22,
              currentIndex: currentIndex,
              items: bottomNavigationItem,
            )
          : BottomNavigationBar(
              elevation: 5,
              currentIndex: currentIndex,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              iconSize: 22,
              type: BottomNavigationBarType.fixed,
              onTap: onTap,
              items: bottomNavigationItem,
            ),
    );
  }
}

class _BottomNavIcon extends ConsumerWidget {
  const _BottomNavIcon({
    Key? key,
    required this.iconPath,
    this.color,
    this.hasNoBadge = true,
    this.badgeWidget,
  }) : super(key: key);

  final String iconPath;
  final Color? color;
  final bool hasNoBadge;
  final Widget? badgeWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (hasNoBadge) {
      return PlatformSvg.asset(iconPath, color: color);
    }
    return Stack(
      children: [
        PlatformSvg.asset(iconPath, color: color),
        Positioned(top: 0, right: 0, child: badgeWidget!)
      ],
    );
  }
}

class _WishlistBadgeConsumer extends StatelessWidget {
  const _WishlistBadgeConsumer(this.backgroundColor, this.textColor);
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) =>
      Consumer(builder: (BuildContext context, WidgetRef ref, Widget? _) {
        final wishlistState = ref.watch(wishlistNotifierProvider);

        return wishlistState.wishlist!.isEmpty
            ? const SizedBox.shrink()
            : CircleAvatar(
                radius: 6,
                backgroundColor: backgroundColor,
                child: Text(
                  '${wishlistState.wishlist!.length}',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.buttonTextSemiBold
                      .copyWith(fontSize: 8, color: textColor),
                ),
              );
      });
}

class _CartBadgeConsumer extends StatelessWidget {
  const _CartBadgeConsumer(this.backgroundColor, this.textColor);
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) =>
      Consumer(builder: (BuildContext context, WidgetRef ref, Widget? _) {
        final cartState = ref.watch(cartNotifierProvider);

        if (cartState.cart != null) {
          return cartState.cart!.isEmpty
              ? const SizedBox.shrink()
              : CircleAvatar(
                  radius: 6,
                  backgroundColor: backgroundColor,
                  child: Text(
                    '${cartState.cart?.length}',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.buttonTextSemiBold
                        .copyWith(fontSize: 8, color: textColor),
                  ),
                );
        } else {
          return const SizedBox();
        }
      });
}
