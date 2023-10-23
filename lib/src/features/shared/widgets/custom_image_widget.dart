import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poc_app/src/core/constants/app_colors.dart';
import 'package:poc_app/src/core/constants/app_images.dart';
import 'package:poc_app/src/core/constants/svgs.dart';
import 'package:poc_app/src/core/utilities/platform_svg.dart';

class CustomImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? placeholder;
  const CustomImageWidget(
      {super.key,
      required this.imageUrl,
      this.width,
      this.height,
      this.fit,
      this.placeholder});

  @override
  Widget build(BuildContext context) => imageUrl.isNotEmpty
      ? CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          fit: BoxFit.cover,
          placeholder: (context, url) => ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(AppImages.contentBlock),
          ),
          errorWidget: (context, url, error) => SizedBox(
            height: height,
            width: width,
            child: Container(
              color: AppColors.grey.withOpacity(.5),
              child: Center(
                child: PlatformSvg.asset(
                  SvgIcons.imageIcon,
                  width: 19.w,
                  height: 19.h,
                ),
              ),
            ),
          ),
        )
      : SizedBox(
          height: height,
          width: width,
          child: Container(
            color: AppColors.grey.withOpacity(.5),
            child: Center(
              child: PlatformSvg.asset(
                SvgIcons.imageIcon,
                width: 19.w,
                height: 19.h,
              ),
            ),
          ),
        );
}
