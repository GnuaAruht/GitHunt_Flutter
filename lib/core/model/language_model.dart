import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'language_model.g.dart';

@collection
class LanguageModel {

  Id id = Isar.autoIncrement;
  final String name;
  final String? colorCode;

  LanguageModel({required this.name, this.colorCode});

  factory LanguageModel.allLanguage() => LanguageModel(name: 'All Languages');

  @ignore
  Color? get color {
    if (colorCode == null) return null;
    var hex = colorCode!.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex';
    }
    return Color(int.parse(hex, radix: 16));
  }
  
}
