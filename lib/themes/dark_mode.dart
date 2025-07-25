import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: const Color(0xFF121212),
    primary: const Color(0xFF4CAF50), // Bright green for dark mode
    secondary: const Color(0xFF1E1E1E),
    tertiary: const Color(0xFF2A2A2A),
    inversePrimary: Colors.grey.shade300,
    outline: Colors.grey.shade600,
    shadow: Colors.black.withOpacity(0.3),
  ),
  shadowColor: Colors.black.withOpacity(0.3),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.grey.shade300),
  ),
  cardTheme: CardThemeData(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    color: const Color(0xFF2A2A2A),
  ),
);
