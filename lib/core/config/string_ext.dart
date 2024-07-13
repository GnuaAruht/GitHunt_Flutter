

import 'package:flutter/material.dart';

extension StringExt on String {
  Color? get color {
    var hex = replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex';
    }
    return Color(int.parse(hex, radix: 16));
  }
}