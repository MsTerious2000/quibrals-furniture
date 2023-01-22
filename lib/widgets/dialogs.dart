import 'package:flutter/material.dart';
import 'package:quibrals_furniture/widgets/colors.dart';
import 'package:quibrals_furniture/widgets/texts.dart';

Widget closeOnlyDialog(
  BuildContext context,
  String title,
  String message,
) {
  return AlertDialog(
    scrollable: true,
    title: Column(
      children: [
        poppins(title, black, 20, fsNormal, fwBold, taCenter),
        const Divider(thickness: 2),
      ],
    ),
    content: poppins(message, black, 15, fsNormal, fwNormal, taLeft),
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
