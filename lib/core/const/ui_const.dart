import 'package:flutter/material.dart';

const defaultPadding = 18.0;
const defaultRadius = 12.0;

const minFilterBtnWidth = 100.0;

List<BoxShadow> getBoxShadow(BuildContext context) {
  return [
    BoxShadow(
      color: Theme.of(context).colorScheme.shadow,
      offset: const Offset(0.0, 1.0),
      blurRadius: 1.0,
    ),
  ];
}
