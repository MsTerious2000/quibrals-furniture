import 'package:flutter/material.dart';

Color black = Colors.black;
Color darkGreen = Colors.green.shade900;
Color darkRed = Colors.red.shade900;
Color white = Colors.white;

// wood palette
Color hickory = HexColor('#371D10');

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
