import 'package:flutter/material.dart';
import 'package:quibrals_furniture/widgets/colors.dart';
import 'package:quibrals_furniture/widgets/dialogs.dart';
import 'package:quibrals_furniture/widgets/texts.dart';
import 'package:url_launcher/url_launcher.dart';

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
        title: Row(
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/quibrals-furniture-logo.png'),
                ),
              ),
            ),
            const SizedBox(width: 10),
            moonDance(widget.title, white, 25, fsNormal, fwNormal, taCenter),
          ],
        ),
        backgroundColor: hickory,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.message, color: white),
          ),
        ],
      ),
      drawer: Drawer(),
    );
  }

  Future<void> openMessenger() async {
    if (!await launchUrl(
      Uri.parse('https://m.me/quibralsfurniture'),
      mode: LaunchMode.externalApplication,
    )) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => errorDialog(context, 'Cannot open Messenger!'),
      );
    }
  }

  Future<void> openFacebook() async {
    if (!await launchUrl(
      Uri.parse('https://www.facebook.com/quibralsfurniture'),
      mode: LaunchMode.externalApplication,
    )) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => errorDialog(context, 'Cannot open Facebook!'),
      );
    }
  }
}
