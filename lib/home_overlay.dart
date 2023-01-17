import 'package:flutter/material.dart';
import 'package:quibrals_furniture/pages/about_us.dart';
import 'package:quibrals_furniture/pages/bookings.dart';
import 'package:quibrals_furniture/pages/contact_us.dart';
import 'package:quibrals_furniture/pages/home.dart';
import 'package:quibrals_furniture/widgets/colors.dart';
import 'package:quibrals_furniture/widgets/dialogs.dart';
import 'package:quibrals_furniture/widgets/texts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeOverlay extends StatefulWidget {
  const HomeOverlay({super.key});

  @override
  State<HomeOverlay> createState() => _HomeOverlayState();
}

class _HomeOverlayState extends State<HomeOverlay> {
  var mobileLayout = 600;
  double mobilePadding = 20;
  double desktopPadding = 150;
  bool isMobile = false;

  final List<Widget> screenWidget = const [
    Home(),
    AboutUs(),
    Bookings(),
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
                      image: AssetImage('images/quibrals-furniture-logo.png'),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                moonDance(title, white, 30, fsNormal, fwNormal, taCenter),
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
                    moonDance(title, white, 25, fsNormal, fwNormal, taCenter),
                  ],
                ),
              ),
              _drawerTile(Icons.home, 'Home', 0),
              _drawerTile(Icons.info, 'About Us', 1),
              _drawerTile(Icons.edit_calendar, 'Bookings', 2),
              _drawerTile(Icons.message, 'Contact Us', 3),
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? mobilePadding : desktopPadding,
                vertical: 20,
              ),
              child: screenWidget[screenNumber],
            ),
          ],
        ),
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

  Future<void> openMessenger() async {
    if (!await launchUrl(
      Uri.parse(messengerLink),
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
      Uri.parse(facebookPageLink),
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
