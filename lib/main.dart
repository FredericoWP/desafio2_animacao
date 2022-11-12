import 'package:animation/desafio2.dart';
import 'package:animation/shape.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Desafio2());

class AnimatedContainerApp extends StatefulWidget {
  const AnimatedContainerApp({super.key});

  @override
  State<AnimatedContainerApp> createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  Shape circle =
      Circle(size: 50, alignment: Alignment.bottomRight, color: Colors.blue);
  Shape rectangle =
      Rectangle(size: 50, alignment: Alignment.topCenter, color: Colors.green);
  bool isCircle = true;

  @override
  Widget build(BuildContext context) {
    final shape = isCircle ? rectangle : circle;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              isCircle = !isCircle;
            });
          },
          child: WidgetAnimated(shape: shape),
        ),
      ),
    );
  }
}

class WidgetAnimated extends StatelessWidget {
  const WidgetAnimated({super.key, required this.shape});
  final Shape shape;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: shape.alignment,
      duration: const Duration(seconds: 1),
      child: AnimatedContainer(
        margin: const EdgeInsets.all(10),
        width: shape.width,
        height: shape.height,
        decoration: BoxDecoration(
          color: shape.color,
          borderRadius: BorderRadius.circular(shape.borderRadius),
        ),
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}
