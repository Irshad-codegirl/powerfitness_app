import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:powerfitness/resource/app_icons.dart';

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
        _SocialCircle(imagePath: AppIcons.gmail, onTap: onGoogleTap),
        SizedBox(width: 16.w),
        _SocialCircle(imagePath: AppIcons.fb, onTap: onFacebookTap),
        SizedBox(width: 16.w),
        _SocialCircle(imagePath: AppIcons.mark, onTap: onFingerprintTap),
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
      child: SvgPicture.asset(imagePath, width: 35.w, height: 35.w),
    );
  }
}
