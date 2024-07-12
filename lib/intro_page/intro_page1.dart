import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 200),
      color: Colors.pink[100],
      child: const Text(
        "hello world",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),
        textAlign: TextAlign.center,
      ),
    );
  }
}
