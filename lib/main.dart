import 'package:flutter/material.dart';
import 'package:quibrals_furniture/pages/home.dart';

void main() {
  runApp(const QuibralsFurniture());
}

class QuibralsFurniture extends StatelessWidget {
  const QuibralsFurniture({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'Quibral\'s Furniture';
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: HomePage(title: title),
    );
  }
}

// responsive navbar web: https://youtu.be/hPdd-UbACNE