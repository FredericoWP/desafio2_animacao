// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Desafio2 extends StatelessWidget {
  const Desafio2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Lista(),
    );
  }
}

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const WidgetExpansive(),
    );
  }
}

// Row [text, icone]
// column [image, text]

class WidgetExpansive extends StatefulWidget {
  const WidgetExpansive({super.key});

  @override
  State<WidgetExpansive> createState() => _WidgetExpansiveState();
}

class _WidgetExpansiveState extends State<WidgetExpansive> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          title: const Text("Titulo"),
          trailing: AnimatedRotation(
            turns: isExpanded ? 0 : 0.5,
            duration: const Duration(milliseconds: 250),
            child: const Icon(Icons.arrow_drop_down),
          ),
        ),
        AnimatedAlign(
          alignment: Alignment.topCenter,
          duration: const Duration(seconds: 5),
          heightFactor: 1,
          child: SizedBox(
            child: !isExpanded
                ? null
                : Column(
                    children: const [
                      FlutterLogo(size: 50),
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
