import 'package:flutter/material.dart';

List<Color> colorList = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.purple,
];

class AppTheme {
  final bool isDarkMode;
  final int selectedColor;

  AppTheme({
    this.isDarkMode = false,
    this.selectedColor = 0,
  })  : assert(selectedColor >= 0, 'selectedColor must be greater than 0'),
        assert(selectedColor < colorList.length,
            'selectedColor must be less than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        colorSchemeSeed: colorList[selectedColor],
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      );

  AppTheme copyWith({bool? isDarkMode, int? selectedColor}) => AppTheme(
        isDarkMode: isDarkMode ?? this.isDarkMode,
        selectedColor: selectedColor ?? this.selectedColor,
      );
}
