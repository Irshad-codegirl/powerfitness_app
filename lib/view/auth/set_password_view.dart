import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powerfitness/app_routes.dart';
import 'package:powerfitness/resource/app_colors.dart';
import 'package:powerfitness/view/auth/auth_shared.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPageScaffold(
      title: 'Set Password',
      topContent: Padding(
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
      bottomContent: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.lightpurple),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(28.w, 26.h, 28.w, 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              SizedBox(height: 24.h),
              Center(
                child: AuthPrimaryButton(
                  label: 'Reset Password',
                  onTap: () => Get.toNamed(AppRoutes.fingerprint),
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
