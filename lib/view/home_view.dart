import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:powerfitness/controllers/auth_controller.dart';
import 'package:powerfitness/resource/app_colors.dart';
import 'package:powerfitness/resource/app_fonts.dart';

class HomeScreen extends GetView<AuthController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black1,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Home',
              style: AppFonts.poppinsStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12.h),
            ElevatedButton(
              onPressed: controller.logout,
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
