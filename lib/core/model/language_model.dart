import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'language_model.g.dart';

@collection
class Language {

  static final allLanguage = Language(title: 'All Languages',value: "");

  bool get isAllLanguage => value.isEmpty;

  Id id = Isar.autoIncrement;
  final String title;
  final String value;
  final String? colorCode;

  Language({required this.title,required this.value, this.colorCode});

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
