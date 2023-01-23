import 'package:flutter/material.dart';
import 'package:quibrals_furniture/widgets/colors.dart';
import 'package:quibrals_furniture/widgets/texts.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        moonDance('Products', maroon, 40, fsNormal, fwBold, taCenter),
        const Divider(thickness: 1, height: 50),
        moonDance('Coming Soon...', steelBlue, 40, fsNormal, fwBold, taCenter),
      ],
    );
  }
}
