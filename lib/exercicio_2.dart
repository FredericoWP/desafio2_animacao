import 'package:animation/src/class.dart';
import 'package:animation/src/content_tile.dart';
import 'package:animation/src/widget_expansive.dart';
import 'package:flutter/material.dart';

class ListExpansive extends StatefulWidget {
  const ListExpansive({super.key});

  @override
  State<ListExpansive> createState() => _ListExpansiveState();
}

class _ListExpansiveState extends State<ListExpansive> {
  bool isExpanded = false;
  int indexSelected = -1;

  _onTap(int index) {
    setState(() {
      if (indexSelected != index) {
        indexSelected = index;
      } else {
        indexSelected = -1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListExpansive"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: List.generate(
          50,
          (index) => CardWidgetExpansive(
            tile: TileExpansive(
              title: "TileExpansive ${index < 10 ? '0$index' : index}",
              content: const ContentExpansive(),
              onTap: () => _onTap(index),
              isSelect: indexSelected == index,
            ),
          ),
        ),
      ),
    );
  }
}
