// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class WidgetExpansive {
  final String title;
  final Icon icon;
  final Widget content;
  final Color? colorTitle;
  final Color? colorIcon;
  final bool isSelect;
  final Function()? onTap;
  WidgetExpansive({
    required this.title,
    this.icon = const Icon(Icons.arrow_drop_up),
    required this.content,
    this.colorTitle,
    this.colorIcon,
    this.isSelect = false,
    this.onTap,
  });
}

class TileExpansive extends WidgetExpansive {
  TileExpansive({
    required super.title,
    required super.content,
    super.isSelect,
    super.icon,
    super.onTap,
  }) : super(
          colorTitle: isSelect ? Colors.blue : Colors.grey,
          colorIcon: isSelect ? Colors.blue : Colors.grey,
        );
}
