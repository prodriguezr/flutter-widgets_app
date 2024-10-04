import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

List<MenuItem> appMenuItems = <MenuItem>[
  const MenuItem(
    title: 'Buttons',
    subtitle: 'Multiple buttons in Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  const MenuItem(
    title: 'Cards',
    subtitle: 'A stylyzed container',
    link: '/cards',
    icon: Icons.card_travel_outlined,
  ),
];
