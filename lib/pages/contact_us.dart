import 'package:flutter/material.dart';
import 'package:quibrals_furniture/widgets/colors.dart';
import 'package:quibrals_furniture/widgets/texts.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        moonDance('Contact Us', maroon, 40, fsNormal, fwBold, taCenter),
        const Divider(thickness: 1, height: 50),
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              sm: 6,
              child: _contactCard(
                'assets/images/facebook-logo.png',
                'Facebook Page',
                facebookPageLink,
              ),
            ),
            ResponsiveGridCol(
              sm: 6,
              child: _contactCard(
                'assets/images/messenger-logo.png',
                'Messenger',
                messengerLink,
              ),
            ),
            ResponsiveGridCol(
              sm: 6,
              child: _contactCard(
                'assets/images/gmail-logo.png',
                'Gmail',
                gmailLink,
              ),
            ),
            ResponsiveGridCol(
              sm: 6,
              child: _contactCard(
                'assets/images/mobile-call.png',
                'Contact Number',
                contactNumber,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _contactCard(String imageAsset, String title, String subtitle) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: transparent,
            child: SizedBox(child: Image.asset(imageAsset)),
          ),
          title: poppins(title, hickory, 20, fsNormal, fwBold, taLeft),
          subtitle: poppins(subtitle, gray, 12, fsItalic, fwBold, taLeft),
        ),
      ),
    );
  }
}
