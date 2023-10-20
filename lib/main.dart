import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_theme.dart';
import 'package:poc_app/src/features/shared/widgets/loading_indicator.dart';
import 'package:poc_app/src/services/go_router_service.dart';
import 'package:poc_app/src/services/logger_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  runApp(
    ProviderScope(
      observers: [Logger()],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);

    return GestureDetector(
      onTap: () {
        var currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        builder: (context, child) => GlobalLoaderOverlay(
          overlayColor: AppColors.primaryColor.withOpacity(.2),
          useDefaultLoading: true,
          overlayWidget: Center(
            child: LoadingIndicator(size: 60.sp),
          ),
          child: MaterialApp.router(
            title: 'POC App',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            routerDelegate: router.routerDelegate,
          ),
        ),
      ),
    );
  }
}
