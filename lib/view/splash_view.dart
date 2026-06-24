import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:powerfitness/resource/app_colors.dart';
import 'package:powerfitness/resource/app_images.dart';
import 'package:powerfitness/view/onboardingA1_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        // Use offAllNamed to clear the splash from the navigation stack
         Get.to(
                () => const OnBoardingScreen(),
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 300),
              );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black1,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
        child: SafeArea(
          child: Center(
            child: Image.asset(
              AppImages.logo,
              width: 260,
              height: 180,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
