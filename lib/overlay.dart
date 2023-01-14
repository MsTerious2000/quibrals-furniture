import 'package:flutter/material.dart';
import 'package:quibrals_furniture/pages/about_us.dart';
import 'package:quibrals_furniture/pages/bookings.dart';
import 'package:quibrals_furniture/pages/contact_us.dart';
import 'package:quibrals_furniture/pages/home.dart';
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
  final List<Widget> screenWidget = const [
    Home(),
    AboutUs(),
    Bookings(),
    ContactUs(),
  ];
  int screenNumber = 0;

  @override
  Widget build(BuildContext context) {
    return TooltipVisibility(
      visible: false,
      child: Scaffold(
        appBar: AppBar(
          title: FittedBox(
            child: Row(
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
                moonDance(
                    widget.title, white, 30, fsNormal, fwNormal, taCenter),
              ],
            ),
          ),
          backgroundColor: hickory,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: InkWell(
                onTap: () => openFacebook(),
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('images/facebook-logo.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: InkWell(
                onTap: () => openMessenger(),
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('images/messenger-logo.png'),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: beige,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: hickory,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('images/quibrals-furniture-logo.png'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    moonDance(
                        widget.title, white, 25, fsNormal, fwNormal, taCenter),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: hickory),
                title: poppins('Home', hickory, 15, fsNormal, fwBold, taLeft),
                onTap: () {
                  if (mounted) {
                    Navigator.pop(context);
                    setState(() => screenNumber = 0);
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.info, color: hickory),
                title:
                    poppins('About Us', hickory, 15, fsNormal, fwBold, taLeft),
                onTap: () {
                  if (mounted) {
                    Navigator.pop(context);
                    setState(() => screenNumber = 1);
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.edit_calendar, color: hickory),
                title:
                    poppins('Bookings', hickory, 15, fsNormal, fwBold, taLeft),
                onTap: () {
                  if (mounted) {
                    Navigator.pop(context);
                    setState(() => screenNumber = 2);
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.message, color: hickory),
                title: poppins(
                    'Contact Us', hickory, 15, fsNormal, fwBold, taLeft),
                onTap: () {
                  if (mounted) {
                    Navigator.pop(context);
                    setState(() => screenNumber = 3);
                  }
                },
              ),
            ],
          ),
        ),
        body: screenWidget[screenNumber],
      ),
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
