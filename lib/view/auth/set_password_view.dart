import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:powerfitness/resource/appFonts.dart';
import 'package:powerfitness/resource/appString.dart';
import 'package:powerfitness/resource/app_colors.dart';

import 'package:powerfitness/view/auth/auth_shared.dart';
import 'package:powerfitness/view/auth/fingerprint_view.dart';
import 'package:powerfitness/widgets/auth_input_field.dart';
import 'package:powerfitness/widgets/auth_primary_button.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPageScaffold(
      title: AppStrings.setPasswordTitle,
      contentPadding: 50,
      horizontalPadding: 0,
      content: Column(
        children: [
          Text(
            AppStrings.setPasswordDesc,
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
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
            decoration: const BoxDecoration(color: AppColors.lightpurple),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(AppStrings.labelPassword),
                SizedBox(height: 8.h),
                AuthInputField(
                  hintText: AppStrings.hintPassword,
                  obscureText: true,
                ),
                SizedBox(height: 12.h),
                LabelText(AppStrings.labelConfirmPassword),
                SizedBox(height: 8.h),
                AuthInputField(
                  hintText: AppStrings.hintPassword,
                  obscureText: true,
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          Center(
            child: AuthPrimaryButton(
              label: AppStrings.btnResetPassword,
              onTap: () => Get.to(
                () => const FingerprintScreen(),
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 300),
              ),
              width: 160.w,
            ),
          ),
        ],
      ),
    );
  }
}