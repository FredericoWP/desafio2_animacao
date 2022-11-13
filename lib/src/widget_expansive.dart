import 'package:animation/src/class.dart';
import 'package:flutter/material.dart';

class CardWidgetExpansive extends StatelessWidget {
  const CardWidgetExpansive({
    super.key,
    this.isSelected = false,
    required this.tile,
  });

  final bool isSelected;
  final TileExpansive tile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: tile.onTap,
          title: Text(tile.title),
          trailing: AnimatedRotation(
              turns: tile.isSelect ? 0 : 0.5,
              duration: const Duration(milliseconds: 250),
              child: tile.icon),
          iconColor: tile.colorIcon,
          textColor: tile.colorTitle,
        ),
        ClipRect(
          child: AnimatedAlign(
            heightFactor: tile.isSelect ? 1 : 0,
            alignment:
                tile.isSelect ? Alignment.topCenter : Alignment.bottomCenter,
            duration: const Duration(milliseconds: 250),
            child: SizedBox(child: tile.content),
          ),
        ),
      ],
    );
  }
}
