import 'package:flutter/material.dart';
import 'package:quibrals_furniture/widgets/colors.dart';
import 'package:quibrals_furniture/widgets/texts.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
      horizontalGridSpacing: 10,
      verticalGridSpacing: 10,
      horizontalGridMargin: 10,
      verticalGridMargin: 10,
      minItemWidth: 100,
      minItemsPerRow: 1,
      maxItemsPerRow: 3,
      listViewBuilderOptions: ListViewBuilderOptions(),
      children: List.generate(
        20,
        (index) => ColoredBox(
          color: Colors.lightBlue,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              '$index',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
