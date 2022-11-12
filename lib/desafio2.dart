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
      appBar: AppBar(
        title: const Text("ListExpansive"),
      ),
      body: const ListExpansive(),
    );
  }
}

class ListExpansive extends StatefulWidget {
  const ListExpansive({super.key});

  @override
  State<ListExpansive> createState() => _ListExpansiveState();
}

class _ListExpansiveState extends State<ListExpansive> {
  bool isExpanded = false;
  int indexSelected = -1;
  ScrollController controller = ScrollController();

  void _onTap(int index) {
    setState(() {
      var teste = controller.position.saveOffset();
      // controller = ScrollController(initialScrollOffset: controller.offset);
      print("index: $index");
      print("offset: ${controller.offset}");
      print("minScrollExtent: ${controller.position.minScrollExtent}");
      print("maxScrollExtent: ${controller.position.maxScrollExtent}");
      print("extentAfter: ${controller.position.extentAfter}");
      print("extentBefore: ${controller.position.extentBefore}");
      print("extentInside: ${controller.position.extentInside}");
      print("===============================================================");
      // controller.animateTo(
      //     controller.offset +
      //         (controller.position.extentInside -
      //             controller.position.extentBefore),
      //     duration: const Duration(seconds: 1),
      //     curve: Curves.linear);
      indexSelected = index == indexSelected ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: List.generate(
        50,
        (index) {
          return CardList(
            index: index,
            isSelected: indexSelected == index,
            onPressed: () => _onTap(index),
          );
        },
      ),
    );
  }
}

class CardList extends StatelessWidget {
  const CardList(
      {super.key,
      required this.index,
      this.isSelected = false,
      this.onPressed});
  final bool isSelected;
  final int index;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onPressed,
          textColor: isSelected ? Colors.blue : Colors.black,
          iconColor: isSelected ? Colors.blue : Colors.black,
          title: Text("Titulo $index"),
          trailing: AnimatedRotation(
            turns: isSelected ? 0 : 0.5,
            duration: const Duration(milliseconds: 250),
            child: const Icon(Icons.arrow_drop_up),
          ),
        ),
        //if (isSelected)
        ClipRect(
          child: AnimatedAlign(
            alignment:
                isSelected ? Alignment.topCenter : Alignment.bottomCenter,
            duration: const Duration(milliseconds: 250),
            heightFactor: isSelected ? 1 : 0,
            curve: Curves.linear,
            child: Container(
              color: Colors.grey[100],
              child: Column(
                children: const [
                  FlutterLogo(size: 50),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
