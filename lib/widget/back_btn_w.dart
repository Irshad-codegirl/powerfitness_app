import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class CustomBackButton extends StatelessWidget {
  final String imagePath;
  final Widget? navigateTo;
  final Color iconColor;
  final VoidCallback? onBack;              // ← Sabse best aur safe

  const CustomBackButton({
    super.key,
    required this.imagePath,
    this.navigateTo,
    this.iconColor = Colors.white,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () {
            if (onBack != null) {
              onBack!();
            } else if (navigateTo != null) {
              Get.to(
                () => navigateTo!,
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            } else {
              Get.back();
            }
          },
          child: Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Icon(
                Icons.arrow_back_ios,
                color: iconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}