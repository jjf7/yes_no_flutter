import 'package:flutter/material.dart';

Color customColor = const Color.fromARGB(255, 212, 53, 233);

List<Color> colors = [
  customColor,
  Colors.brown,
  Colors.pink,
  Colors.red,
  Colors.yellow,
  Colors.green,
  Colors.orange,
  Colors.blue,
  Colors.indigo
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= colors.length - 1);

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colors[selectedColor],
    );
  }
}
