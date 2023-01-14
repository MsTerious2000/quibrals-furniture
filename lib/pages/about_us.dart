import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 8,
        runSpacing: 4,
        children: [
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900,
              child: const FittedBox(child: Text('MR')),
            ),
            label: const Text('Marisol Rosario'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900,
              child: const FittedBox(child: Text('AM')),
            ),
            label: const Text('Arvin Monton'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900,
              child: const FittedBox(child: Text('JN')),
            ),
            label: const Text('John Robert Nerio'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900,
              child: const FittedBox(child: Text('MQ')),
            ),
            label: const Text('Mikhael Phillip Quibral'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900,
              child: const FittedBox(child: Text('JO')),
            ),
            label: const Text('Jamessteven Olaivar'),
          ),
        ],
      ),
    );
  }
}
