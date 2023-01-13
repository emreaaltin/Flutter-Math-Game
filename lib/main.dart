import 'package:flutter/material.dart';
import 'package:mathgame/homepage.dart';

void main() {
  runApp(const MathGame());
}

class MathGame extends StatelessWidget {
  const MathGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
