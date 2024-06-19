import 'package:flutter/material.dart';
import 'package:githunt_flutter/main/main_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const GitHuntApp());
}

class GitHuntApp extends StatelessWidget {
  const GitHuntApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GitHunt',
      theme: _buildTheme(Brightness.light),
      home: const MainPage(),
    );
  }
}


ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);
  return baseTheme.copyWith(
    textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
  );
}


