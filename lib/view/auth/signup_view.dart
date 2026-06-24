import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powerfitness/app_routes.dart';
import 'package:powerfitness/resource/app_colors.dart';
import 'package:powerfitness/view/auth/auth_shared.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPageScaffold(
      title: 'Create Account',
      topContent: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Let\'s Start!',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      bottomContent: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.lightpurple),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(28.w, 24.h, 28.w, 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _LabelText('Full name'),
              SizedBox(height: 8.h),
              const AuthInputField(hintText: 'example@example.com'),
              SizedBox(height: 12.h),
              const _LabelText('Email or Mobile Number'),
              SizedBox(height: 8.h),
              const AuthInputField(hintText: '+123 567 89000'),
              SizedBox(height: 12.h),
              const _LabelText('Password'),
              SizedBox(height: 8.h),
              const AuthInputField(
                hintText: '****************',
                obscureText: true,
              ),
              SizedBox(height: 12.h),
              const _LabelText('Confirm Password'),
              SizedBox(height: 8.h),
              const AuthInputField(
                hintText: '****************',
                obscureText: true,
              ),
              SizedBox(height: 16.h),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Text(
                    'By continuing, you agree to\nTerms of Use and Privacy Policy.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 10.sp,
                      height: 1.25,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14.h),
              AuthPrimaryButton(label: 'Sign Up', onTap: () {}),
              SizedBox(height: 16.h),
              const _MutedCenterText('or sign up with'),
              SizedBox(height: 14.h),
              const SocialSignInRow(),
              SizedBox(height: 18.h),
              Center(
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.login),
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
            ],
          ),
        ),
      ),
    );
  }
}

class _LabelText extends StatelessWidget {
  final String text;

  const _LabelText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: Colors.black87,
        fontSize: 11.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _MutedCenterText extends StatelessWidget {
  final String text;

  const _MutedCenterText(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: GoogleFonts.poppins(color: Colors.white70, fontSize: 10.sp),
      ),
    );
  }
}
