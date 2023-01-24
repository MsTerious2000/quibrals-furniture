import 'package:flutter/material.dart';
import 'package:quibrals_furniture/pages/about_us.dart';
import 'package:quibrals_furniture/pages/products.dart';
import 'package:quibrals_furniture/pages/contact_us.dart';
import 'package:quibrals_furniture/pages/home.dart';
import 'package:quibrals_furniture/widgets/colors.dart';
import 'package:quibrals_furniture/widgets/dialogs.dart';
import 'package:quibrals_furniture/widgets/responsive.dart';
import 'package:quibrals_furniture/widgets/texts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeOverlay extends StatefulWidget {
  const HomeOverlay({super.key});

  @override
  State<HomeOverlay> createState() => _HomeOverlayState();
}

class _HomeOverlayState extends State<HomeOverlay> {
  final List<Widget> screenWidget = const [
    Home(),
    AboutUs(),
    Products(),
    ContactUs(),
  ];
  int screenNumber = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > mobileLayout) {
          isMobile = false;
          return _mainContent();
        } else {
          isMobile = true;
          return _mainContent();
        }
      },
    );
  }

  Widget _mainContent() {
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
                      image: AssetImage(
                          'assets/images/quibrals-furniture-logo.png'),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                moonDance(appTitle, white, 30, fsNormal, fwNormal, taCenter),
              ],
            ),
          ),
          backgroundColor: hickory,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: InkWell(
                onTap: () =>
                    openLink(facebookPageLink, 'Cannot open Facebook!'),
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/images/facebook-logo.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: InkWell(
                onTap: () => openLink(messengerLink, 'Cannot open Messenger!'),
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/images/messenger-logo.png'),
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
                          image: AssetImage(
                              'assets/images/quibrals-furniture-logo.png'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    moonDance(
                        appTitle, white, 25, fsNormal, fwNormal, taCenter),
                  ],
                ),
              ),
              _drawerTile(Icons.home, 'Home', 0),
              _drawerTile(Icons.info, 'About Us', 1),
              _drawerTile(Icons.shopping_cart, 'Products', 2),
              _drawerTile(Icons.message, 'Contact Us', 3),
              const Divider(height: 20, thickness: 2),
              Icon(Icons.copyright, color: black, size: 15),
              poppins(
                  '$appTitle 2023', black, 12, fsNormal, fwNormal, taCenter),
              poppins('All rights reserved.', black, 12, fsNormal, fwNormal,
                  taCenter),
            ],
          ),
        ),
        body: screenWidget[screenNumber],
      ),
    );
  }

  Widget _drawerTile(IconData icon, String title, int screen) {
    return ListTile(
      leading: Icon(icon, color: hickory),
      title: poppins(title, hickory, 15, fsNormal, fwBold, taLeft),
      onTap: () {
        if (mounted) {
          Navigator.pop(context);
          setState(() => screenNumber = screen);
        }
      },
    );
  }

  Future<void> openLink(String link, String errorMessage) async {
    if (!await launchUrl(
      Uri.parse(link),
      mode: LaunchMode.externalApplication,
    )) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => errorDialog(context, errorMessage),
      );
    }
  }
}
