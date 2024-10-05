import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const name = 'AnimatedScreen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double height = 50;
  double width = 50;
  Color color = Colors.red;
  double borderRadius = 10;

  void changeShape() {
    final random = Random();

    setState(() {
      height = random.nextInt(300) + 120.toDouble();
      width = random.nextInt(300) + 120.toDouble();
      color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1,
      );
      borderRadius = random.nextInt(100) + 20.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.elasticOut,
          height: height <= 0 ? 0 : height,
          width: width <= 0 ? 0 : width,
          decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius),
          ),
        ),
      ),
    );
  }
}
