import 'package:flutter/material.dart';
import 'package:quibrals_furniture/widgets/colors.dart';
import 'package:quibrals_furniture/widgets/texts.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        moonDance('Bookings', maroon, 40, fsNormal, fwBold, taCenter),
        const Divider(thickness: 1, height: 50),
      ],
    );
  }
}
