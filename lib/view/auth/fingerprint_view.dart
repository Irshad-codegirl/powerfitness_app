import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:powerfitness/resource/appFonts.dart';
import 'package:powerfitness/resource/appString.dart';
import 'package:powerfitness/resource/app_colors.dart';
import 'package:powerfitness/resource/app_images.dart';
import 'package:powerfitness/view/auth/auth_shared.dart';
import 'package:powerfitness/widgets/auth_primary_button.dart';

class FingerprintScreen extends StatelessWidget {
  const FingerprintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPageScaffold(
      title: AppStrings.fingerprintTitle,
      contentPadding: 60,
      horizontalPadding: 0,
      content: Column(
        children: [
          Text(
            AppStrings.fingerprintDesc,
            textAlign: TextAlign.center,
            style: AppFonts.poppinsStyle(
              color: Colors.white70,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
              height: 1.35,
            ),
          ),
          SizedBox(height: 40.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
            decoration: const BoxDecoration(color: AppColors.lightpurple),
            child: Image.asset(
              AppImages.finger,
              width: 162.w,
              height: 230.h,
              fit: BoxFit.contain,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 40.h),
          AuthPrimaryButton(
            label: AppStrings.btnSkip,
            onTap: () {},
            width: 120.w,
          ),
          SizedBox(height: 14.h),
          AuthPrimaryButton(
            label: AppStrings.btnContinue,
            onTap: () {},
            width: 120.w,
          ),
        ],
      ),
    );
  }
}