import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powerfitness/resource/app_colors.dart';
import 'package:powerfitness/view/auth/auth_shared.dart';

class FingerprintScreen extends StatelessWidget {
  const FingerprintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPageScaffold(
      title: 'Set Your Fingerprint',
      topContent: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed, sed do eiusmod incididunt ut labore et\ndolore.',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: 10.sp,
            height: 1.35,
          ),
        ),
      ),
      bottomContent: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.lightpurple),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.fingerprint, size: 150.sp, color: Colors.white),
            SizedBox(height: 18.h),
            AuthPrimaryButton(label: 'Skip', onTap: () {}, width: 140.w),
            SizedBox(height: 12.h),
            AuthPrimaryButton(label: 'Continue', onTap: () {}, width: 140.w),
          ],
        ),
      ),
    );
  }
}
