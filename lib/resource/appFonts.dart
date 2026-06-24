import 'package:flutter/material.dart';

/// Centralised font helper.
///
/// TTF files must be declared in pubspec.yaml under `flutter › fonts`.
/// Example pubspec entry (add once per family):
///
/// ```yaml
/// flutter:
///   fonts:
///     - family: Poppins
///       fonts:
///         - asset: assets/fonts/Poppins-Light.ttf
///           weight: 300
///         - asset: assets/fonts/Poppins-Regular.ttf
///           weight: 400
///         - asset: assets/fonts/Poppins-Medium.ttf
///           weight: 500
///         - asset: assets/fonts/Poppins-SemiBold.ttf
///           weight: 600
///         - asset: assets/fonts/Poppins-Bold.ttf
///           weight: 700
///     - family: Rajdhani
///       fonts:
///         - asset: assets/fonts/Rajdhani-Regular.ttf
///           weight: 400
///         - asset: assets/fonts/Rajdhani-Medium.ttf
///           weight: 500
///         - asset: assets/fonts/Rajdhani-SemiBold.ttf
///           weight: 600
///         - asset: assets/fonts/Rajdhani-Bold.ttf
///           weight: 700
///     - family: LeagueSpartan
///       fonts:
///         - asset: assets/fonts/LeagueSpartan-Regular.ttf
///           weight: 400
///         - asset: assets/fonts/LeagueSpartan-Bold.ttf
///           weight: 700
/// ```
///
/// Download free TTF files from https://fonts.google.com and place them in
/// `assets/fonts/` (already listed in pubspec below).
class AppFonts {
  AppFonts._();

  // ── Family name constants (must match pubspec `family:` keys exactly)
  static const String poppins      = 'Poppins';
  static const String rajdhani     = 'Rajdhani';
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
  }) =>
      TextStyle(
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
  }) =>
      TextStyle(
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
  }) =>
      TextStyle(
        fontFamily: leagueSpartan,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );
}