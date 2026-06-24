import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:powerfitness/app_routes.dart';
import 'package:powerfitness/resource/app_colors.dart';
import 'package:powerfitness/widget/bg_w.dart';
import 'package:powerfitness/widget/onBoardingSlide_w.dart';

import '../../resource/app_images.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  Timer? _autoAdvanceTimer;
  int _currentPage = 0;
  // Slide B/C/D share the same indicator range (pages 1-3 → shown as 0-2)
  static const int _slideTotalDots = 3;

  @override
  void initState() {
    super.initState();
    _autoAdvanceTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted) {
        return;
      }

      if (_currentPage < 3) {
        _nextPage();
      } else {
        _autoAdvanceTimer?.cancel();
      }
    });
  }

  void _nextPage() {
    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onGetStarted() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void dispose() {
    _autoAdvanceTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

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
          controller: _pageController,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (index) => setState(() => _currentPage = index),
          children: [
            // ── Page A 
            _buildPageA(),

            // ── Page B 
            OnboardingSlideWidget(
              backgroundImage: AppImages.onboardingBgC,
              iconAsset: AppImages.iconActiveLifestyle,
              title: 'Start Your Journey Towards A\nMore Active Lifestyle',
              buttonLabel: 'Next',
              onButtonTap: _nextPage,
              onSkip: _onGetStarted,
              currentPage: 0,
              totalPages: _slideTotalDots,
            ),

            // ── Page C 
            OnboardingSlideWidget(
              backgroundImage: AppImages.onboardingBgB,
              iconAsset: AppImages.iconNutrition,
              title: 'Find Nutrition Tips That Fit\nYour Lifestyle.',
              buttonLabel: 'Next',
              onButtonTap: _nextPage,
              onSkip: _onGetStarted,
              currentPage: 1,
              totalPages: _slideTotalDots,
            ),

            // ── Page D 
            OnboardingSlideWidget(
              backgroundImage: AppImages.onboardingBgD,
              iconAsset: AppImages.iconCommunity,
              title: 'A Community For You,\nChallenge Yourself',
              buttonLabel: 'Get Started',
              onButtonTap: _onGetStarted,
              onSkip: _onGetStarted,
              currentPage: 2,
              totalPages: _slideTotalDots,
            ),
          ],
        ),
      ),
    );
  }

  // ── Page A: Welcome splash 

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
          onTap: _nextPage,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
             
            
                // "Welcome to"
                Text(
                  'Welcome to',
                  style: GoogleFonts.leagueSpartan(
                    color: AppColors.yellow,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0,
                  ),
                ),
                SizedBox(height: 10.h),
            
                // App logo
                Image.asset(
                  AppImages.pflogo,
                  width: 120.w,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 8.h),
                Text.rich(
                  TextSpan(
                    style: GoogleFonts.rajdhani(
                      color: AppColors.purple,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0,
                    ),
                    children: [
                      const TextSpan(text: 'POWERVATE '),
                      TextSpan(
                        text: 'FITNESS',
                        style: GoogleFonts.rajdhani(
                          color: AppColors.yellow,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                ),
               
                Text(
                  'Agility! Ability! Mentality!',
                  style: GoogleFonts.poppins(
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
