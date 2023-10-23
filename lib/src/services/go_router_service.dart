import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_app/src/core/constants/app_routes.dart';
import 'package:poc_app/src/features/home/models/food.dart';
import 'package:poc_app/src/features/home/views/food_category_list_view.dart';
import 'package:poc_app/src/features/home/views/food_details_view.dart';
import 'package:poc_app/src/features/home/views/food_list_view.dart';
import 'package:poc_app/src/features/root/views/root_view.dart';
import 'package:poc_app/src/features/root/views/splash_screen.dart';
import 'package:poc_app/src/services/go_router_page_builder.dart';

final goRouterProvider = Provider((ref) => GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: '/',
          builder: (context, state) => SplashScreen(
            key: state.pageKey,
          ),
        ),
        GoRoute(
          path: AppRoutes.root,
          name: AppRoutes.root,
          builder: (context, state) => RootView(
            key: state.pageKey,
          ),
          routes: [
            GoRoute(
              path: AppRoutes.foodCategory,
              name: AppRoutes.foodCategory,
              builder: (context, state) => FoodCategoryListView(
                key: state.pageKey,
              ),
              routes: [
                GoRoute(
                    path: AppRoutes.foodList,
                    name: AppRoutes.foodList,
                    builder: (context, state) => FoodListView(
                          category:
                              (state.extra as Map?)?['category'] as String,
                          key: state.pageKey,
                        ),
                    pageBuilder: (context, state) =>
                        RouterTransitionFactory.getTransitionPage(
                          context: context,
                          state: state,
                          child: FoodListView(
                            category:
                                (state.extra as Map?)?['category'] as String,
                            key: state.pageKey,
                          ),
                          type: 'fade', // fade|rotation|scale|size
                        ),
                    routes: [
                      GoRoute(
                        path: AppRoutes.foodDetails,
                        name: AppRoutes.foodDetails,
                        builder: (context, state) => FoodDetailsView(
                          food: (state.extra as Map?)?['food'] as Food,
                          key: state.pageKey,
                        ),
                        pageBuilder: (context, state) =>
                            RouterTransitionFactory.getTransitionPage(
                          context: context,
                          state: state,
                          child: FoodDetailsView(
                            food: (state.extra as Map?)?['food'] as Food,
                            key: state.pageKey,
                          ),
                          type: 'fade', // fade|rotation|scale|size
                        ),
                      ),
                    ]),
              ],
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) => ErrorPage(
        errmsg: state.error.toString(),
        key: state.pageKey,
      ),
    ));

class ErrorPage extends StatelessWidget {
  final String errmsg;
  const ErrorPage({super.key, required this.errmsg});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Error Page'),
        ),
        body: Center(
          child: Text(errmsg),
        ),
      );
}
