import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialSignInRow extends StatelessWidget {
  final List<String>? imagePaths; // String paths instead of IconData
  final VoidCallback? onGoogleTap;
  final VoidCallback? onFacebookTap;
  final VoidCallback? onFingerprintTap;

  const SocialSignInRow({
    super.key,
    this.imagePaths,
    this.onGoogleTap,
    this.onFacebookTap,
    this.onFingerprintTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialCircle(
          imagePath: 'assets/images/Gmail.png',
          onTap: onGoogleTap,
        ),
        SizedBox(width: 16.w),
        _SocialCircle(
          imagePath: 'assets/images/Facebook.png',
          onTap: onFacebookTap,
        ),
        SizedBox(width: 16.w),
        _SocialCircle(
          imagePath: 'assets/images/Mark.png',
          onTap: onFingerprintTap,
        ),
      ],
    );
  }
}

class _SocialCircle extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;

  const _SocialCircle({required this.imagePath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45.w,
        height: 45.w,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(13.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Image.asset(
          imagePath,
          width: 24.sp,
          height: 24.sp,
          // color: AppColors.lightpurple, 
        ),
      ),
    );
  }
}