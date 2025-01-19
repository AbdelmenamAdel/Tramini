import 'package:ai_app/features/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Tramini());
}

class Tramini extends StatelessWidget {
  const Tramini({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
