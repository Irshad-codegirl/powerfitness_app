import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:powerfitness/controllers/splash_controller.dart';
import 'package:powerfitness/resource/app_fonts.dart';
import 'package:powerfitness/resource/app_string.dart';
import 'package:powerfitness/resource/app_colors.dart';
import 'package:powerfitness/resource/app_icons.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppIcons.logo,
                  width: 169.w,
                  height: 112.h,
                  fit: BoxFit.contain,
                ),
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
