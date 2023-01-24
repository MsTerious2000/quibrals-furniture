import 'package:flutter/material.dart';
import 'package:quibrals_furniture/widgets/colors.dart';
import 'package:quibrals_furniture/widgets/responsive.dart';
import 'package:quibrals_furniture/widgets/texts.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > mobileLayout) {
          return _mainContent(desktopPadding);
        } else {
          return _mainContent(mobilePadding);
        }
      },
    );
  }

  Widget _mainContent(double responsivePadding) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: responsivePadding),
      children: [
        const Divider(thickness: 1, height: 20),
        moonDance('About Us', maroon, 40, fsNormal, fwBold, taCenter),
        const Divider(thickness: 1, height: 20),
        Image.asset('assets/images/carve.jpg'),
        const Divider(thickness: 1, height: 50),
        poppins(
            '$indent $appTitle is a backyard furniture shop. We make custom furniture, restores and remodels antique furniture. We also make unique drift wood pieces. Our prices are negotiable and we deliver to any area in Camarines Norte (Bicol). For orders outside Camarines Norte, our products and services may not include delivery.\n$indent $appTitle is owned and managed by Mr. Armando Pardo Quibral and his son, Arman Quibral.\n$indent Our shop is located at Buyuboy Subdivision, Matacong, San Lorenzo Ruiz, Camarines Norte.',
            black,
            15,
            fsNormal,
            fwBold,
            taJustify),
        const SizedBox(height: 100),
      ],
    );
  }
}
