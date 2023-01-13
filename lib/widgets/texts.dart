import 'package:flutter/material.dart';

TextAlign taCenter = TextAlign.center;

Widget poppins(String text, TextAlign textAlign) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'Poppins',
    ),
    textAlign: textAlign,
  );
}
