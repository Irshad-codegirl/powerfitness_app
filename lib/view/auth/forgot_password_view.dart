import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:powerfitness/controllers/auth_controller.dart';
import 'package:powerfitness/resource/app_fonts.dart';
import 'package:powerfitness/resource/app_string.dart';
import 'package:powerfitness/resource/app_colors.dart';

import 'package:powerfitness/view/auth/auth_shared.dart';
import 'package:powerfitness/view/widgets/auth_input_field.dart';
import 'package:powerfitness/view/widgets/auth_primary_button.dart';

class ForgotPasswordScreen extends GetView<AuthController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPageScaffold(
      title: AppStrings.forgotPasswordTitle,
      contentPadding: 60,
      horizontalPadding: 0,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppStrings.forgotPasswordHeader,
            style: AppFonts.poppinsStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w),
            child: Text(
              AppStrings.forgotPasswordDesc,
              textAlign: TextAlign.center,
              style: AppFonts.poppinsStyle(
                color: Colors.white70,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                height: 1.35,
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
            decoration: const BoxDecoration(color: AppColors.lightpurple),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(AppStrings.labelEnterEmail),
                SizedBox(height: 8.h),
                AuthInputField(
                  hintText: AppStrings.hintEmail,
                  controller: controller.forgotEmailController,
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          Center(
            child: AuthPrimaryButton(
              label: AppStrings.btnContinue,
              onTap: controller.sendPasswordReset,
              width: 160.w,
            ),
          ),
        ],
      ),
    );
  }
}
