import 'package:flutter/material.dart';
import 'package:quibrals_furniture/home_overlay.dart';
import 'package:quibrals_furniture/widgets/texts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const QuibralsFurniture());
}

class QuibralsFurniture extends StatelessWidget {
  const QuibralsFurniture({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const HomeOverlay(),
    );
  }
}
