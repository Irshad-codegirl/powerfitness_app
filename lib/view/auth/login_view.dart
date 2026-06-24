import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powerfitness/resource/app_colors.dart';
import 'package:powerfitness/view/auth/auth_shared.dart';
import 'package:powerfitness/view/auth/forgot_password_view.dart';
import 'package:powerfitness/view/auth/signup_view.dart';
import 'package:powerfitness/view/onboardingA1_view.dart';
import 'package:powerfitness/widgets/auth_input_field.dart';
import 'package:powerfitness/widgets/auth_primary_button.dart';
import 'package:powerfitness/widgets/social_sign_in_row.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPageScaffold(
      title: 'Log In',
      onBack: () => Get.to(
        () => const OnBoardingScreen(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 300),
      ),
      contentPadding: 50,
      horizontalPadding: 0,
      content: Column(
        children: [
          Text(
            'Welcome',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 26.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 18.h),

          // Description Text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore\nmagna aliqua.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                height: 1.35,
                letterSpacing: 0,
              ),
            ),
          ),

          SizedBox(height: 50.h),

          // Form Container
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
            decoration: const BoxDecoration(color: AppColors.lightpurple),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LabelText('Username or email'),
                SizedBox(height: 8.h),
                const AuthInputField(hintText: 'example@example.com'),
                SizedBox(height: 14.h),
                const LabelText('Password'),
                SizedBox(height: 8.h),
                const AuthInputField(
                  hintText: '****************',
                  obscureText: true,
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Get.to(
                      () => const ForgotPasswordScreen(),
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 300),
                    ),
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.poppins(
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

          // Login Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AuthPrimaryButton(
              label: 'Log In',
              onTap: () {},
              width: double.infinity,
            ),
          ),

          SizedBox(height: 20.h),
          const MutedCenterText('or sign up with'),
          SizedBox(height: 14.h),
          const SocialSignInRow(),

          SizedBox(height: 30.h),

          // Sign Up Link
          Center(
            child: GestureDetector(
              onTap: () => Get.to(
                () => const SignupScreen(),
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 300),
              ),
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 11.sp,
                  ),
                  children: [
                    const TextSpan(text: 'Don\'t have an account? '),
                    TextSpan(
                      text: 'Sign Up',
                      style: GoogleFonts.poppins(
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
          SizedBox(height: 20.h), // Bottom padding
        ],
      ),
    );
  }
}
