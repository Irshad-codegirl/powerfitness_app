import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powerfitness/resource/app_colors.dart';
import 'package:powerfitness/view/auth/auth_shared.dart';
import 'package:powerfitness/view/auth/fingerprint_view.dart';
import 'package:powerfitness/widgets/auth_input_field.dart';
import 'package:powerfitness/widgets/auth_primary_button.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPageScaffold(
      title: 'Set Password',
      contentPadding: 50,
      horizontalPadding: 0,
      content: Column(
        children: [
          Text(
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
          SizedBox(height: 40.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
            decoration: const BoxDecoration(color: AppColors.lightpurple),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
          SizedBox(height: 40.h),
          Center(
            child: AuthPrimaryButton(
              label: 'Reset Password',
              onTap: () => Get.to(
                () => const FingerprintScreen(),
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
