import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poc_app/src/features/cart/views/cart_view.dart';
import 'package:poc_app/src/features/home/views/home_view.dart';
import 'package:poc_app/src/features/root/widgets/bottom_nav_bar.dart';
import 'package:poc_app/src/features/shared/notifiers/internet_connectivity_notifier.dart';
import 'package:poc_app/src/features/shared/widgets/no_internet_view.dart';
import 'package:poc_app/src/features/wishlist/views/wishlist_view.dart';

final rootPageProvider = StateProvider.autoDispose((ref) => 0);

class RootView extends ConsumerWidget {
  static const String path = '/root';
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageIndex = ref.watch(rootPageProvider);
    final internetState = ref.watch(internetConnectivityProvider);

    return Scaffold(
      body: IndexedStack(
          index: currentPageIndex,
          children: internetState.when(
              data: (value) => value
                  ? [
                      const HomeView(),
                      const WishlistView(),
                      const CartView(),
                      // const HomeView(),
                    ]
                  : [
                      const NoInternetView(),
                      const NoInternetView(),
                      const NoInternetView(),
                    ],
              error: (string, _) => [
                    const NoInternetView(),
                    const NoInternetView(),
                    const NoInternetView(),
                    // const SizedBox.shrink(),
                  ],
              loading: () => [
                    const SizedBox.shrink(),
                    const SizedBox.shrink(),
                    const SizedBox.shrink(),

                    // const SizedBox.shrink(),
                  ])),
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentPageIndex,
        onTap: (index) => ref.read(rootPageProvider.notifier).state = index,
      ),
    );
  }
}
