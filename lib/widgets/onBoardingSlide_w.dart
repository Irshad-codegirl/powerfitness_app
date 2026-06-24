import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerfitness/resource/app_colors.dart';

class OnboardingSlideWidget extends StatelessWidget {
  final String backgroundImage;
  final String iconAsset;
  final String title;
  final String buttonLabel;
  final VoidCallback onButtonTap;
  final bool showSkip;
  final VoidCallback? onSkip;
  final int currentPage;
  final int totalPages;

  const OnboardingSlideWidget({
    super.key,
    required this.backgroundImage,
    required this.iconAsset,
    required this.title,
    required this.buttonLabel,
    required this.onButtonTap,
    this.showSkip = true,
    this.onSkip,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Full-screen background photo
        Positioned.fill(
          child: Image.asset(
            backgroundImage,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),

        // Dark scrim at bottom so card reads clearly
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 320.h,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.3)],
              ),
            ),
          ),
        ),

        // Centered card (purple/violet frosted look)
        Positioned.fill(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 20.h,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.lightpurple, // purple from design
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon
                      Image.asset(iconAsset, width: 48.w, height: 48.w),
                      SizedBox(height: 10.h),

                      // Title
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.35,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // Page indicator dots
                      _PageDots(current: currentPage, total: totalPages),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                _OnboardingButton(label: buttonLabel, onTap: onButtonTap),
              ],
            ),
          ),
        ),

        // Skip button top-right
        if (showSkip)
          Positioned(
            top: 80.h,
            right: 20.w,
            child: GestureDetector(
              onTap: onSkip ?? onButtonTap,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Skip',
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'LeagueSpartan',
                    ),
                  ),
                  Icon(Icons.play_arrow, color: AppColors.yellow),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

// ─── Page indicator dots

class _PageDots extends StatelessWidget {
  final int current;
  final int total;

  const _PageDots({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (i) {
        final isActive = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          width: isActive ? 20.w : 20.w,
          height: 3.h,
          decoration: BoxDecoration(
            color: isActive ? AppColors.light : AppColors.purple,
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}

// ─── Primary button

class _OnboardingButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _OnboardingButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.45),
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(color: Colors.white54),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 0,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
