import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthLabel extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const AuthLabel(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color ?? Colors.black87,
        fontSize: fontSize ?? 12.sp,
        fontWeight: fontWeight ?? FontWeight.w600,
      ),
    );
  }
}

class AuthSubtitle extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;

  const AuthSubtitle(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: GoogleFonts.poppins(
        color: color ?? Colors.white70,
        fontSize: fontSize ?? 11.sp,
        height: 1.4,
      ),
    );
  }
}

class AuthHeading extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;

  const AuthHeading(this.text, {super.key, this.color, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color ?? Colors.white,
        fontSize: fontSize ?? 24.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
