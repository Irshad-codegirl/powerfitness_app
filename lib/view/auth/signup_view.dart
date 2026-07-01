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
import 'package:powerfitness/view/widgets/social_sign_in_row.dart';

class SignupScreen extends GetView<AuthController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPageScaffold(
      title: AppStrings.signupTitle,
      contentPadding: 20,
      horizontalPadding: 0,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppStrings.letsStart,
            style: AppFonts.poppinsStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 30.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
            decoration: const BoxDecoration(color: AppColors.lightpurple),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(AppStrings.labelFullName),
                SizedBox(height: 8.h),
                AuthInputField(
                  hintText: AppStrings.hintFullName,
                  controller: controller.fullNameController,
                ),
                SizedBox(height: 12.h),
                LabelText(AppStrings.labelEmailOrPhone),
                SizedBox(height: 8.h),
                AuthInputField(
                  hintText: AppStrings.hintEmailOrPhone,
                  controller: controller.signupEmailController,
                ),
                SizedBox(height: 12.h),
                LabelText(AppStrings.labelPassword),
                SizedBox(height: 8.h),
                AuthInputField(
                  hintText: AppStrings.hintPassword,
                  obscureText: true,
                  controller: controller.signupPasswordController,
                ),
                SizedBox(height: 12.h),
                LabelText(AppStrings.labelConfirmPassword),
                SizedBox(height: 8.h),
                AuthInputField(
                  hintText: AppStrings.hintPassword,
                  obscureText: true,
                  controller: controller.confirmPasswordController,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Text(
              AppStrings.termsPrefix,
              textAlign: TextAlign.center,
              style: AppFonts.poppinsStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                height: 1.25,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Text(
              AppStrings.termsLink,
              textAlign: TextAlign.center,
              style: AppFonts.poppinsStyle(
                color: AppColors.yellow,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                height: 1.25,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AuthPrimaryButton(
              label: AppStrings.btnSignUp,
              onTap: controller.signUpWithEmail,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 16.h),
          MutedCenterText(AppStrings.orSignupWith),
          SizedBox(height: 14.h),
          SocialSignInRow(onGoogleTap: controller.signInWithGoogle),
          SizedBox(height: 18.h),
          Center(
            child: GestureDetector(
              onTap: controller.goToLogin,
              child: RichText(
                text: TextSpan(
                  style: AppFonts.poppinsStyle(fontSize: 11.sp),
                  children: [
                    TextSpan(text: AppStrings.alreadyAccount),
                    TextSpan(
                      text: AppStrings.logIn,
                      style: AppFonts.poppinsStyle(
                        color: AppColors.yellow,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
