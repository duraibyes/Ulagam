import 'package:flutter/material.dart';

ThemeData ulagamTheme(Brightness brightness) {
  final scheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF0E7490),
    brightness: brightness,
    primary: brightness == Brightness.light
        ? const Color(0xFF0F5F63)
        : const Color(0xFF7DDBD4),
  );
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    brightness: brightness,
    fontFamily: 'NotoSans',
    fontFamilyFallback: const ['NotoSansTamil'],
  );
  return base.copyWith(
    textTheme: base.textTheme
        .apply(fontFamily: 'NotoSans', fontFamilyFallback: const ['NotoSansTamil'])
        .copyWith(
          headlineMedium: base.textTheme.headlineMedium?.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
          titleLarge: base.textTheme.titleLarge?.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: base.textTheme.bodyLarge?.copyWith(fontSize: 18, height: 1.35),
          bodyMedium: base.textTheme.bodyMedium?.copyWith(fontSize: 16, height: 1.4),
        ),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: scheme.surfaceContainerLow,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(48, 52),
        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
  );
}
