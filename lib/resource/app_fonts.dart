import 'package:flutter/material.dart';

class AppFonts {
  AppFonts._();

  // ── Family name constants (must match pubspec `family:` keys exactly)
  static const String poppins = 'Poppins';
  static const String rajdhani = 'Rajdhani';
  static const String leagueSpartan = 'LeagueSpartan';

  // ────────────────────────────────────────────────
  // Poppins helpers
  // ────────────────────────────────────────────────

  static TextStyle poppinsStyle({
    Color color = Colors.white,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    double height = 1.0,
    double letterSpacing = 0,
  }) => TextStyle(
    fontFamily: poppins,
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: height,
    letterSpacing: letterSpacing,
  );

  // ────────────────────────────────────────────────
  // Rajdhani helpers
  // ────────────────────────────────────────────────

  static TextStyle rajdhaniStyle({
    Color color = Colors.white,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    double letterSpacing = 0,
  }) => TextStyle(
    fontFamily: rajdhani,
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
  );

  // ────────────────────────────────────────────────
  // LeagueSpartan helpers
  // ────────────────────────────────────────────────

  static TextStyle leagueSpartanStyle({
    Color color = Colors.white,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    double letterSpacing = 0,
  }) => TextStyle(
    fontFamily: leagueSpartan,
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
  );
}
