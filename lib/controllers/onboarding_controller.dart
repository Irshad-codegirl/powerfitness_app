import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerfitness/models/onboarding_slide_model.dart';
import 'package:powerfitness/resource/app_images.dart';
import 'package:powerfitness/resource/app_string.dart';
import 'package:powerfitness/routes/app_routes.dart';

class OnboardingController extends GetxController {
  static const int slideTotalDots = 3;

  final PageController pageController = PageController();
  final currentPage = 0.obs;

  final slides = const [
    OnboardingSlideModel(
      backgroundImage: AppImages.onboardingBgC,
      iconAsset: AppImages.iconActiveLifestyle,
      title: AppStrings.onboardingTitleB,
      buttonLabel: AppStrings.btnNext,
      dotIndex: 0,
    ),
    OnboardingSlideModel(
      backgroundImage: AppImages.onboardingBgB,
      iconAsset: AppImages.iconNutrition,
      title: AppStrings.onboardingTitleC,
      buttonLabel: AppStrings.btnNext,
      dotIndex: 1,
    ),
    OnboardingSlideModel(
      backgroundImage: AppImages.onboardingBgD,
      iconAsset: AppImages.iconCommunity,
      title: AppStrings.onboardingTitleD,
      buttonLabel: AppStrings.btnGetStarted,
      dotIndex: 2,
    ),
  ];

  Timer? _autoAdvanceTimer;

  @override
  void onInit() {
    super.onInit();
    _autoAdvanceTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (currentPage.value < 3) {
        nextPage();
      } else {
        _autoAdvanceTimer?.cancel();
      }
    });
  }

  @override
  void onClose() {
    _autoAdvanceTimer?.cancel();
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 3) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void getStarted() {
    Get.toNamed(AppRoutes.login);
  }
}
