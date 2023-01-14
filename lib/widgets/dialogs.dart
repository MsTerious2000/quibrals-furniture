import 'package:flutter/material.dart';
import 'package:quibrals_furniture/widgets/colors.dart';
import 'package:quibrals_furniture/widgets/texts.dart';

Widget checkOnlyDialog(
  BuildContext context,
  String title,
  Color color,
  double fontSize,
  FontStyle fontStyle,
  FontWeight fontWeight,
  TextAlign textAlign,
) {
  return AlertDialog(
    scrollable: true,
    title: Column(
      children: [
        poppins(title, color, fontSize, fontStyle, fontWeight, textAlign),
        const Divider(thickness: 2),
      ],
    ),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.check, color: darkGreen),
        ),
      ],
    ),
  );
}

Widget closeOnlyDialog(
  BuildContext context,
  String title,
  List<Widget> contents,
) {
  return AlertDialog(
    scrollable: true,
    title: Column(
      children: [
        poppins(title, black, 20, fsNormal, fwBold, taCenter),
        const Divider(thickness: 2),
      ],
    ),
    content: Column(children: contents),
    actions: [
      IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.check, color: darkGreen),
      ),
    ],
  );
}

Widget errorDialog(BuildContext context, String errorMessage) {
  return AlertDialog(
    scrollable: true,
    title: Column(
      children: [
        poppins('ERROR', darkRed, 20, fsNormal, fwBold, taCenter),
        const Divider(thickness: 2),
      ],
    ),
    content: poppins(errorMessage, black, 15, fsNormal, fwNormal, taCenter),
    actions: [
      IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.check, color: darkGreen),
      ),
    ],
  );
}
