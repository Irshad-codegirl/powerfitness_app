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

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPageScaffold(
      title: AppStrings.loginTitle,
      onBack: controller.goToOnboarding,
      contentPadding: 50,
      horizontalPadding: 0,
      content: Column(
        children: [
          Text(
            AppStrings.welcomeText,
            style: AppFonts.poppinsStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 18.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Text(
              AppStrings.loginDesc,
              textAlign: TextAlign.center,
              style: AppFonts.poppinsStyle(
                color: Colors.white70,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                height: 1.35,
              ),
            ),
          ),
          SizedBox(height: 50.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
            decoration: const BoxDecoration(color: AppColors.lightpurple),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(AppStrings.labelUsernameOrEmail),
                SizedBox(height: 8.h),
                AuthInputField(
                  hintText: AppStrings.hintEmail,
                  controller: controller.loginEmailController,
                ),
                SizedBox(height: 14.h),
                LabelText(AppStrings.labelPassword),
                SizedBox(height: 8.h),
                AuthInputField(
                  hintText: AppStrings.hintPassword,
                  controller: controller.loginPasswordController,
                  obscureText: true,
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: controller.goToForgotPassword,
                    child: Text(
                      AppStrings.forgotPassword,
                      style: AppFonts.poppinsStyle(
                        color: AppColors.hintcolor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AuthPrimaryButton(
              label: AppStrings.btnLogin,
              onTap: controller.loginWithEmail,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 20.h),
          MutedCenterText(AppStrings.orSignUpWith),
          SizedBox(height: 14.h),
          SocialSignInRow(onGoogleTap: controller.signInWithGoogle),
          SizedBox(height: 30.h),
          Center(
            child: GestureDetector(
              onTap: controller.goToSignup,
              child: RichText(
                text: TextSpan(
                  style: AppFonts.poppinsStyle(fontSize: 11.sp),
                  children: [
                    TextSpan(text: AppStrings.noAccount),
                    TextSpan(
                      text: AppStrings.signUp,
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
