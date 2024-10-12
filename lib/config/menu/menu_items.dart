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
  const MenuItem(
    title: 'UI Controls',
    subtitle: 'Textfield, Checkbox, Slider, etc',
    link: '/ui-controls',
    icon: Icons.check_box_outline_blank_outlined,
    screen: 'UiControlsScreen',
  ),
  const MenuItem(
    title: 'App Tutorial',
    subtitle: 'Short introductory tutorial',
    link: '/tutorial',
    icon: Icons.auto_fix_high_outlined,
    screen: 'AppTutorialScreen',
  ),
  const MenuItem(
    title: 'Infinite Scroll & Pull to refresh',
    subtitle: 'Infinite scroll and pull to refresh in Flutter',
    link: '/infinite',
    icon: Icons.auto_fix_high_outlined,
    screen: 'InfiniteScrollScreen',
  ),
];
