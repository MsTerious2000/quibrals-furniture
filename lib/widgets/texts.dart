import 'package:flutter/material.dart';

FontStyle italic = FontStyle.italic;
FontStyle fsNormal = FontStyle.normal;

FontWeight fwBold = FontWeight.bold;
FontWeight fwNormal = FontWeight.normal;

TextAlign taCenter = TextAlign.center;
TextAlign taJustify = TextAlign.justify;
TextAlign taLeft = TextAlign.left;
TextAlign taRight = TextAlign.right;

Widget poppins(
  String text,
  Color color,
  double fontSize,
  FontStyle fontStyle,
  FontWeight fontWeight,
  TextAlign textAlign,
) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
    ),
    textAlign: textAlign,
  );
}

Widget moonDance(
  String text,
  Color color,
  double fontSize,
  FontStyle fontStyle,
  FontWeight fontWeight,
  TextAlign textAlign,
) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontFamily: 'Moon Dance',
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
    ),
    textAlign: textAlign,
  );
}
