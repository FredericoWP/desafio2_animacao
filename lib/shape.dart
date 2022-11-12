// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class Shape {
  double height;
  double width;
  Color color;
  double borderRadius;
  Alignment alignment;

  Shape(
      {required this.height,
      required this.width,
      required this.color,
      required this.borderRadius,
      required this.alignment});
}

class Circle extends Shape {
  Circle({
    required double size,
    required super.alignment,
    required super.color,
  }) : super(
          height: size,
          width: size,
          borderRadius: size / 2,
        );
}

class Rectangle extends Shape {
  Rectangle({
    required double size,
    required super.alignment,
    required super.color,
  }) : super(
          height: size,
          width: size * 2,
          borderRadius: size * 0.1,
        );
}
