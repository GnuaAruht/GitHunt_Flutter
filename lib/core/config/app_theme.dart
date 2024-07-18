import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData buildLightTheme() {
    var baseTheme = ThemeData(brightness: Brightness.light);
    return baseTheme.copyWith(
      textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF4A6EFB),
        primaryContainer: Colors.white,
        secondaryContainer: Color(0xFFF1B00A),
        surface: Color(0xFFF5F5F5),
        onSurface: Colors.black,
        shadow: Colors.grey,
      ),
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    );
  }

  static ThemeData buildDarkTheme() {
    var baseTheme = ThemeData(brightness: Brightness.dark);
    return baseTheme.copyWith(
      textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF2F8CE5),
        primaryContainer: Color(0xFF2C2C2C),
        secondaryContainer: Color(0xFFC48A04),
        surface: Color(0xFF1E1E1E),
        onSurface: Colors.white,
        shadow: Colors.black26,
      ),
      scaffoldBackgroundColor: const Color(0xFF1E1E1E),
    );
  }
}
