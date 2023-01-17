import 'package:flutter/material.dart';

Color transparent = Colors.transparent;

Color black = Colors.black;
Color darkGreen = Colors.green.shade900;
Color darkRed = Colors.red.shade900;
Color gray = Colors.black45;
Color maroon = HexColor('#800000');
Color steelBlue = HexColor('#4682B4');
Color white = Colors.white;

// wood palette
Color beige = HexColor('#EEDC9A');
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
