// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widgets'),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (_, index) {
        final menuItem = appMenuItems[index];

        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
    this.iconSize = 20,
    this.iconColor,
    this.textColor,
    this.subtitleColor,
    this.onTap,
  });

  final MenuItem menuItem;
  final double? iconSize;
  final Color? iconColor;
  final Color? textColor;
  final Color? subtitleColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(menuItem.title,
          style: TextStyle(color: textColor ?? colorScheme.primary)),
      subtitle: Text(
        menuItem.subtitle,
        style: TextStyle(
          color: subtitleColor ?? colorScheme.secondary,
          fontWeight: FontWeight.w100,
        ),
      ),
      leading: Icon(menuItem.icon,
          color: iconColor ?? colorScheme.primary, size: iconSize),
      trailing: Icon(Icons.arrow_forward_ios_rounded, size: iconSize),
      onTap: onTap ??
          () {
            Navigator.pushNamed(context, menuItem.link);
          },
    );
  }
}
