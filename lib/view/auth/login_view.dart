import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powerfitness/app_routes.dart';
import 'package:powerfitness/resource/app_colors.dart';
import 'package:powerfitness/view/auth/auth_shared.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPageScaffold(
      title: 'Log In',
      topContent: Column(
        mainAxisSize: MainAxisSize.min,
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore\nmagna aliqua.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 11.sp,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
      bottomContent: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.lightpurple),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(28.w, 24.h, 28.w, 28.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _LabelText('Username or email'),
              SizedBox(height: 8.h),
              const AuthInputField(hintText: 'example@example.com'),
              SizedBox(height: 14.h),
              const _LabelText('Password'),
              SizedBox(height: 8.h),
              const AuthInputField(
                hintText: '****************',
                obscureText: true,
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.forgotPassword),
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.poppins(
                      color: AppColors.yellow,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 22.h),
              AuthPrimaryButton(label: 'Log In', onTap: () {}),
              SizedBox(height: 18.h),
              const _MutedCenterText('or sign up with'),
              SizedBox(height: 14.h),
              const SocialSignInRow(),
              SizedBox(height: 24.h),
              Center(
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.signup),
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
