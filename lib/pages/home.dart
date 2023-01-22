import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quibrals_furniture/widgets/colors.dart';
import 'package:quibrals_furniture/widgets/texts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var mobileLayout = 600;
  bool isMobile = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('/images/home-image.png'),
        const Divider(thickness: 1, height: 50),
        moonDance('Welcome to Quibral\'s Furniture!', maroon, 40, fsNormal,
            fwBold, taCenter),
        poppins(
            'The beauty of wood and wood crafting.\nOur backyard shop makes, remodels & restores all kinds of wooden furniture.\nVisit us and check out our catalogs now!',
            black,
            15,
            fsNormal,
            fwBold,
            taCenter),
        const Divider(thickness: 1, height: 50),
        poppins('Our Product and Services', steelBlue, 30, fsNormal, fwBold,
            taCenter),
        poppins(
            'We sell made-to-order furniture and drift wood pieces at affordable prices.\nWe also repair and remodel furniture.\nOur products are unique and of high quality.',
            black,
            15,
            fsNormal,
            fwBold,
            taCenter),
        poppins(
            'If you are looking for a furniture maker in Camarines Norte and the Bicol region with superb craftsmanship, we are here to serve you.',
            black,
            15,
            fsNormal,
            fwBold,
            taCenter),
      ],
    );
  }
}
