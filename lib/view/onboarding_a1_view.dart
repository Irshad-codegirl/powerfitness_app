import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:powerfitness/controller/onboarding_controller.dart';
import 'package:powerfitness/resource/app_fonts.dart';
import 'package:powerfitness/resource/app_string.dart';
import 'package:powerfitness/resource/app_colors.dart';
import 'package:powerfitness/resource/app_icons.dart';

import 'package:powerfitness/view/widgets/bg_w.dart';
import 'package:powerfitness/view/widgets/onboarding_slide_w.dart';

import '../../resource/app_images.dart';

class OnBoardingScreen extends GetView<OnboardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: PageView(
          controller: controller.pageController,
          physics: const BouncingScrollPhysics(),
          onPageChanged: controller.onPageChanged,
          children: [
            _buildPageA(),
            ...controller.slides.map(
              (slide) => OnboardingSlideWidget(
                backgroundImage: slide.backgroundImage,
                iconAsset: slide.iconAsset,
                title: slide.title,
                buttonLabel: slide.buttonLabel,
                onButtonTap: slide.dotIndex == controller.slides.length - 1
                    ? controller.getStarted
                    : controller.nextPage,
                onSkip: controller.getStarted,
                currentPage: slide.dotIndex,
                totalPages: OnboardingController.slideTotalDots,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageA() {
    return AppBackgroundWidget(
      backgroundImage: AppImages.onboardingBg,
      overlayColors: const [
        Color(0xD9000000),
        Color(0x80000000),
        Color(0xE6000000),
      ],
      showAccent: false,
      child: SafeArea(
        child: GestureDetector(
          onTap: controller.nextPage,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.welcomeTo,
                  style: AppFonts.leagueSpartanStyle(
                    color: AppColors.yellow,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.h),
                SvgPicture.asset(
                  AppIcons.logo,
                  width: 120.w,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 8.h),
                Text.rich(
                  TextSpan(
                    style: AppFonts.rajdhaniStyle(
                      color: AppColors.purple,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(text: '${AppStrings.appName} '),
                      TextSpan(
                        text: AppStrings.appNameSuffix,
                        style: AppFonts.rajdhaniStyle(
                          color: AppColors.yellow,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  AppStrings.appTagline,
                  style: AppFonts.poppinsStyle(
                    color: Colors.white70,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
