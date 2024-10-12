import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'ButtonsScreen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        child: Wrap(
          spacing: 10,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('Elevated Button')),
            const ElevatedButton(
                onPressed: null, child: Text('Disabled Elevated Button')),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated Button Icon'),
            ),
            FilledButton(onPressed: () {}, child: const Text('Filled Button')),
            const FilledButton(
                onPressed: null, child: Text('Disabled Filled Button')),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Filled Button Icon'),
            ),
            OutlinedButton(
                onPressed: () {}, child: const Text('Outlined Button')),
            const OutlinedButton(
                onPressed: null, child: Text('Disabled Outlined Button')),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Outlined Button Icon'),
            ),
            TextButton(onPressed: () {}, child: const Text('Text Button')),
            const TextButton(
                onPressed: null, child: Text('Disabled Text Button')),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Text Button Icon'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
            ),
            const CustomButton(
              text: 'Custom Button',
              onPressed: null,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded, color: Colors.white),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colorScheme.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final double? borderRadius;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonStyle,
    this.textStyle,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 20),
      child: Material(
        color: onPressed != null
            ? (buttonStyle?.backgroundColor?.resolve({WidgetState.pressed}) ??
                colorScheme.primary)
            : (buttonStyle?.backgroundColor?.resolve({WidgetState.disabled}) ??
                Colors.grey),
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              text,
              style: textStyle ??
                  const TextStyle(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
