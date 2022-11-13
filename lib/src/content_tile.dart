import 'package:flutter/material.dart';

class ContentExpansive extends StatelessWidget {
  const ContentExpansive({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: const [
          FlutterLogo(),
          Text(
              "Flutterando is the largest Flutter community in Brazil. Think about Flutter, think about Flutterando. Be part of our community!"),
        ],
      ),
    );
  }
}
