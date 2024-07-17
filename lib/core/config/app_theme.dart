import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData buildLightTheme() {
    var baseTheme = ThemeData(
      brightness: Brightness.light
    );
    return baseTheme.copyWith(
      textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
    );
  }

  static ThemeData buildDarkTheme() {
    var baseTheme = ThemeData(brightness: Brightness.dark);
    return baseTheme.copyWith(
      textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
    );
  }
}
