import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powerfitness/resource/app_colors.dart';

class AuthPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;

  const AuthPrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.width,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width:178.w,
          height: 44.h,
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.btnbg,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: Colors.white24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: GoogleFonts.poppins(
              color: textColor ?? Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
