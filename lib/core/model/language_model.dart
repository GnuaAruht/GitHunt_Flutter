import 'package:flutter/material.dart';

class LanguageModel {
  final String name;
  final String? colorCode;

  LanguageModel({required this.name, this.colorCode});

  factory LanguageModel.allLanguage() => LanguageModel(name: 'All Language');

  Color? get color {
    if (colorCode == null) return null;
    var hex = colorCode!.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex';
    }
    return Color(int.parse(hex, radix: 16));
  }
  
}
