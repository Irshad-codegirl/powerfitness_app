import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powerfitness/resource/app_colors.dart';
import 'package:powerfitness/view/auth/auth_shared.dart';
import 'package:powerfitness/view/auth/set_password_view.dart';
import 'package:powerfitness/widgets/auth_input_field.dart';
import 'package:powerfitness/widgets/auth_primary_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPageScaffold(
      title: 'Forgotten Password',
      contentPadding: 60,
      horizontalPadding: 0,
      content: Column(
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
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                height: 1.35,
                letterSpacing: 0,
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
            decoration: const BoxDecoration(color: AppColors.lightpurple),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LabelText('Enter your email address'),
                SizedBox(height: 8.h),
                const AuthInputField(hintText: 'example@example.com'),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          Center(
            child: AuthPrimaryButton(
              label: 'Continue',
              onTap: () => Get.to(
                () => const SetPasswordScreen(),
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
