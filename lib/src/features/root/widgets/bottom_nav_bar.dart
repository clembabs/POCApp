import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/svgs.dart';
import 'package:poc_app/src/core/utilities/platform_svg.dart';

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
            color: AppColors.darkGrey),
        activeIcon: _BottomNavIcon(
          iconPath: SvgIcons.favouriteActiveIcon,
          color: AppColors.primaryColor,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: _BottomNavIcon(
            iconPath: SvgIcons.cartInactiveIcon, color: AppColors.darkGrey),
        activeIcon: _BottomNavIcon(
          iconPath: SvgIcons.cartActiveIcon,
          color: AppColors.primaryColor,
        ),
        label: '',
      ),
      // BottomNavigationBarItem(
      //   icon: _BottomNavIcon(
      //     iconPath: SvgIcons.profileIcon,
      //     color: AppColors.darkGrey,
      //   ),
      //   activeIcon: Icon(Icons.person),
      //   label: '',
      // ),
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

class _BottomNavIcon extends StatelessWidget {
  const _BottomNavIcon({
    Key? key,
    required this.iconPath,
    this.color,
  }) : super(key: key);

  final String iconPath;
  final Color? color;

  @override
  Widget build(BuildContext context) => SizedBox(
        // height: 16.h,
        // width: 16.w,
        child: PlatformSvg.asset(iconPath, color: color),
      );
}
