import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBackgroundWidget extends StatelessWidget {
  final Widget child;
  final String? backgroundImage;
  final List<Color> overlayColors;
  final bool showAccent;
  final Color accentColor;
  final double accentLeft;
  final double accentTop;
  final double accentWidth;
  final double accentHeight;
  final BorderRadius accentBorderRadius;

  const AppBackgroundWidget({
    super.key,
    required this.child,
    this.backgroundImage,
    this.overlayColors = const [
      Color(0xFFF7F7F8),
      Color(0xFFE8F6EC),
      Color(0xFFDFF1E5),
    ],
    this.showAccent = true,
    this.accentColor = const Color(0x1F28A745),
    this.accentLeft = -40,
    this.accentTop = 300,
    this.accentWidth = 370,
    this.accentHeight = 500,
    this.accentBorderRadius = const BorderRadius.all(Radius.circular(40)),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base background color
        Positioned.fill(child: Container(color: overlayColors.first)),

        // Background image
        if (backgroundImage != null)
          Image.asset(
            backgroundImage!,
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),

        // Gradient overlay
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: overlayColors,
              ),
            ),
          ),
        ),

        // Accent blob
        if (showAccent)
          Positioned(
            left: accentLeft.w,
            top: accentTop.h,
            child: Container(
              width: accentWidth.w,
              height: accentHeight.h,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: accentBorderRadius,
              ),
            ),
          ),

        // Child content
        Positioned.fill(child: child),
      ],
    );
  }
}
