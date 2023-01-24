import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:quibrals_furniture/widgets/colors.dart';
import 'package:quibrals_furniture/widgets/dialogs.dart';
import 'package:quibrals_furniture/widgets/texts.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';

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
                context,
                facebookPageLink,
                'assets/images/facebook-logo.png',
                'Facebook Page',
                facebookPageLink,
              ),
            ),
            ResponsiveGridCol(
              sm: 6,
              child: _contactCard(
                context,
                messengerLink,
                'assets/images/messenger-logo.png',
                'Messenger',
                messengerLink,
              ),
            ),
            ResponsiveGridCol(
              sm: 6,
              child: _contactCard(
                context,
                gmailLink,
                'assets/images/gmail-logo.png',
                'Gmail',
                gmailLink,
              ),
            ),
            ResponsiveGridCol(
              sm: 6,
              child: _contactCard(
                context,
                youtubeLink,
                'assets/images/youtube-logo.png',
                'YouTube',
                youtubeLink,
              ),
            ),
            ResponsiveGridCol(sm: 3, child: const SizedBox()),
            ResponsiveGridCol(
              sm: 6,
              child: _contactCard(
                context,
                contactNumber,
                'assets/images/mobile-call.png',
                'Contact Number',
                contactNumber,
              ),
            ),
            ResponsiveGridCol(sm: 3, child: const SizedBox()),
          ],
        ),
      ],
    );
  }

  Widget _contactCard(
    BuildContext context,
    String link,
    String imageAsset,
    String title,
    String subtitle,
  ) {
    return Card(
      elevation: 10,
      child: InkWell(
        onTap: () => openLink(context, link),
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
      ),
    );
  }

  Future<void> openLink(BuildContext context, String link) async {
    if (link == gmailLink) {
      FlutterClipboard.copy(contactNumber).then(
        (value) => showDialog(
          context: context,
          builder: (context) => closeOnlyDialog(
            context,
            'GMAIL',
            'Email address copied!\n$gmailLink',
          ),
        ),
      );
      closeOnlyDialog(context, 'CONTACT NUMBER', 'Contact Number copied!');
    } else if (link == contactNumber) {
      FlutterClipboard.copy(contactNumber).then(
        (value) => showDialog(
          context: context,
          builder: (context) => closeOnlyDialog(
            context,
            'CONTACT NUMBER',
            'Contact Number copied!\n$contactNumber',
          ),
        ),
      );
      closeOnlyDialog(context, 'CONTACT NUMBER', 'Contact Number copied!');
    } else {
      if (!await launchUrl(
        Uri.parse(link),
        mode: LaunchMode.externalApplication,
      )) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => errorDialog(context, 'Cannot open Messenger!'),
        );
      }
    }
  }
}
