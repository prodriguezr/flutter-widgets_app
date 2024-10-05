import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'ProgressScreen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text('Circular Progress Indicator'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(height: 30),
          const Text('Circular and Linear Indicators Controlled'),
          const SizedBox(height: 10),
          _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(
          milliseconds: 300,
        ),
        (value) {
          return value * 2 / 100;
        },
      ).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final value = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: value,
                strokeWidth: 2,
                backgroundColor: Colors.black12,
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: LinearProgressIndicator(
                value: value,
              ))
            ],
          ),
        );
      },
    );
  }
}
