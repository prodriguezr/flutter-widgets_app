import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final String screen;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
    required this.screen,
  });
}

List<MenuItem> appMenuItems = <MenuItem>[
  const MenuItem(
    title: 'Buttons',
    subtitle: 'Multiple buttons in Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
    screen: 'ButtonsScreen',
  ),
  const MenuItem(
    title: 'Cards',
    subtitle: 'A stylyzed container',
    link: '/cards',
    icon: Icons.card_travel_outlined,
    screen: 'CardsScreen',
  ),
  const MenuItem(
    title: 'Progress Indicators',
    subtitle: 'General and Controlled',
    link: '/progress',
    icon: Icons.refresh_rounded,
    screen: 'ProgressScreen',
  ),
  const MenuItem(
    title: 'Snackbars and Dialogs',
    subtitle: 'Show information to the user',
    link: '/snackbars',
    icon: Icons.info_outlined,
    screen: 'SnackbarScreen',
  ),
  const MenuItem(
    title: 'Animated Container',
    subtitle: 'Stateful widget animated',
    link: '/animated',
    icon: Icons.play_circle_outline_rounded,
    screen: 'AnimatedScreen',
  ),
];
