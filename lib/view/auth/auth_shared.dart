import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:powerfitness/resource/app_colors.dart';
import 'package:powerfitness/resource/app_icons.dart';

// ============ 1. System UI Style Widget (Reusable across all screens) ============
class AppSystemUIStyle extends StatelessWidget {
  final Widget child;

  const AppSystemUIStyle({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      child: child,
    );
  }
}

// ============ 2. Auth Header Widget (Back button + Title) ============
class AuthHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  final double horizontalPadding;
  final double verticalPadding;

  const AuthHeader({
    super.key,
    required this.title,
    this.onBack,
    this.horizontalPadding = 16,
    this.verticalPadding = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding.w,
        vertical: verticalPadding.h,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: _BackChevron(onTap: onBack ?? () => Get.back()),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.yellow,
              fontSize: 20.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

// ============ 3. Refactored Auth Page Scaffold ============
class AuthPageScaffold extends StatelessWidget {
  final String title;
  final Widget content;
  final VoidCallback? onBack;
  final double contentPadding; // Top padding between header and content
  final double horizontalPadding; // Side padding for content
  final bool enableScroll; // Enable/disable scrolling

  const AuthPageScaffold({
    super.key,
    required this.title,
    required this.content,
    this.onBack,
    this.contentPadding = 30, // Default spacing
    this.horizontalPadding = 0, // No extra horizontal padding by default
    this.enableScroll = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppSystemUIStyle(
      child: Scaffold(
        backgroundColor: AppColors.black1,
        body: SafeArea(
          child: Column(
            children: [
              AuthHeader(title: title, onBack: onBack),
              SizedBox(height: contentPadding.h),
              Expanded(
                child: enableScroll
                    ? SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding.w,
                          ),
                          child: content,
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding.w,
                        ),
                        child: content,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============ 4. Back Chevron Widget ============
class _BackChevron extends StatelessWidget {
  final VoidCallback onTap;

  const _BackChevron({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        AppIcons.arrow, // Aap ke icon ka sahi naam aur path
        width: 16.w, // Icon ki width
        height: 16.w, // Icon ki height
        colorFilter: const ColorFilter.mode(
          AppColors.yellow, // Jo rang aap dena chahte hain
          BlendMode.srcIn, // Yeh filter color ko SVG par apply kr deta hai
        ),
      ),
    );
  }
}

// ============ 5. Label Text Widget ============
class LabelText extends StatelessWidget {
  final String text;

  const LabelText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.left,
      text,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 12.sp,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

// ============ 6. Muted Center Text Widget ============
class MutedCenterText extends StatelessWidget {
  final String text;

  const MutedCenterText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white70,
          fontSize: 11.sp,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
