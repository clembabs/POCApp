import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  Widget build(BuildContext context) => SizedBox(
        height: 85.h,
        child: BottomNavigationBar(
          elevation: 3,
          currentIndex: currentIndex,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
              icon: _BottomNavIcon(iconPath: SvgIcons.homeInactiveIcon),
              activeIcon: _BottomNavIcon(iconPath: SvgIcons.homeActiveIcon),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _BottomNavIcon(iconPath: SvgIcons.favouriteInactiveIcon),
              activeIcon:
                  _BottomNavIcon(iconPath: SvgIcons.favouriteActiveIcon),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _BottomNavIcon(iconPath: SvgIcons.cartInactiveIcon),
              activeIcon: _BottomNavIcon(iconPath: SvgIcons.cartActiveIcon),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _BottomNavIcon(iconPath: SvgIcons.profileIcon),
              activeIcon: _BottomNavIcon(iconPath: SvgIcons.profileIcon),
              label: '',
            ),
          ],
        ),
      );
}

class _BottomNavIcon extends StatelessWidget {
  const _BottomNavIcon({
    Key? key,
    required this.iconPath,
  }) : super(key: key);

  final String iconPath;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 16.h,
        width: 16.w,
        child: PlatformSvg.asset(iconPath),
      );
}
