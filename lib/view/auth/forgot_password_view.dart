import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powerfitness/app_routes.dart';
import 'package:powerfitness/resource/app_colors.dart';
import 'package:powerfitness/view/auth/auth_shared.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPageScaffold(
      title: 'Forgotten Password',
      topContent: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Forgot Password?',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w),
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
        child: Padding(
          padding: EdgeInsets.fromLTRB(28.w, 28.h, 28.w, 28.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _LabelText('Enter your email address'),
              SizedBox(height: 8.h),
              const AuthInputField(hintText: 'example@example.com'),
              SizedBox(height: 24.h),
              Center(
                child: AuthPrimaryButton(
                  label: 'Continue',
                  onTap: () => Get.toNamed(AppRoutes.setPassword),
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
