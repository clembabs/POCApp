import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_images.dart';
import 'package:poc_app/src/core/constants/app_routes.dart';
import 'package:poc_app/src/core/constants/app_text_styles.dart';
import 'package:poc_app/src/features/shared/widgets/action_button.dart';
import 'package:poc_app/src/services/go_router_service.dart';
import 'package:poc_app/src/services/local_store_helper.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});
  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            final router = ref.watch(goRouterProvider);

            final isOnboarding = LocalStoreHelper.readOnboarding(ref);

            if (animationController.isCompleted && animation.isCompleted) {
              if (isOnboarding == true) {
                router.goNamed(AppRoutes.root);
              } else {
                router.goNamed(AppRoutes.root);
              }
            }
          });
        }));
    animationController.forward();

    // setstate initiation
    setState(() {
      _visible = !_visible;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(gradient: AppColors.primaryColorGradient),
          child: Column(
            children: <Widget>[
              const Spacer(),
              Image.asset(AppImages.snapBite),
              RichText(
                text: TextSpan(
                  text: 'S',
                  style: AppTextStyles.displayOne
                      .copyWith(color: AppColors.yellow),
                  children: [
                    TextSpan(
                      text: 'nap',
                      style: AppTextStyles.displayOne
                          .copyWith(color: AppColors.white),
                    ),
                    const TextSpan(text: 'B'),
                    TextSpan(
                      text: 'ite',
                      style: AppTextStyles.displayOne
                          .copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(AppImages.whiteBackground),
                  Image.asset(AppImages.grillChicken),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 207.w,
                child: Column(
                  children: [
                    Text(
                      'Enjoy',
                      style: AppTextStyles.displayOne.copyWith(
                        fontSize: 32.sp,
                        color: AppColors.yellow,
                      ),
                    ),
                    Text(
                      'Your Meal!',
                      style: AppTextStyles.displayOne.copyWith(
                        fontSize: 32.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ActionButton(
                text: 'Get Started',
                width: 240.w,
                color: AppColors.white,
                style: AppTextStyles.displayThree
                    .copyWith(color: AppColors.primaryColor),
              ),
              const Spacer(),
            ],
          ),
        ),
      );
}
