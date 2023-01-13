import 'package:flutter/material.dart';
import 'package:quibrals_furniture/widgets/colors.dart';
import 'package:quibrals_furniture/widgets/texts.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: poppins(widget.title, taCenter),
        backgroundColor: hickory,
      ),
    );
  }
}
