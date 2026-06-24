import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powerfitness/resource/app_colors.dart';
import 'package:powerfitness/view/auth/auth_shared.dart';
import 'package:powerfitness/view/auth/login_view.dart';
import 'package:powerfitness/widgets/auth_input_field.dart';
import 'package:powerfitness/widgets/auth_primary_button.dart';
import 'package:powerfitness/widgets/social_sign_in_row.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPageScaffold(
      title: 'Create Account',
      contentPadding: 20, // Spacing between header and content
      horizontalPadding: 0,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          // Let's Start Text
          Text(
            'Let\'s Start!',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          
          SizedBox(height: 30.h),
          
          // Form Container
          Container(
           
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
            decoration: const BoxDecoration(color: AppColors.lightpurple),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LabelText('Full name'),
                SizedBox(height: 8.h),
                const AuthInputField(hintText: 'John Doe'),
                SizedBox(height: 12.h),
                
                const LabelText('Email or Mobile Number'),
                SizedBox(height: 8.h),
                const AuthInputField(hintText: '+123 567 89000'),
                SizedBox(height: 12.h),
                
                const LabelText('Password'),
                SizedBox(height: 8.h),
                const AuthInputField(
                  hintText: '****************',
                  obscureText: true,
                ),
                SizedBox(height: 12.h),
                
                const LabelText('Confirm Password'),
                SizedBox(height: 8.h),
                const AuthInputField(
                  hintText: '****************',
                  obscureText: true,
                ),
              ],
            ),
          ),

          SizedBox(height: 20.h),
          
          // Terms Text
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Text(
                'By continuing, you agree to',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12.sp,
               fontWeight: FontWeight.w300,
                  height: 1.25,
                ),
              ),
            ),
          ),
            Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Text(
                'Terms of Use and Privacy Policy.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: AppColors.yellow,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  height: 1.25,
                ),
              ),
            ),
          ),
          
          SizedBox(height: 16.h),
          
          // Sign Up Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AuthPrimaryButton(
              label: 'Sign Up',
              onTap: () {},
              width: double.infinity,
            ),
          ),
          
          SizedBox(height: 16.h),
          const MutedCenterText('or sign up with'),
          SizedBox(height: 14.h),
          const SocialSignInRow(),
          
          SizedBox(height: 18.h),
          
          // Login Link
          Center(
            child: GestureDetector(
              onTap: () =>  Get.to(
                () => const LoginScreen(),
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
                    const TextSpan(text: 'Already have an account? '),
                    TextSpan(
                      text: 'Log in',
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