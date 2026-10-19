import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'features/placement/placement_page.dart';
import 'features/shell/home_shell.dart';
import 'providers.dart';

class UlagamApp extends ConsumerWidget {
  const UlagamApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final mode = switch (profile.value?.themeMode) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
    return MaterialApp(
      title: 'Ulagam',
      theme: ulagamTheme(Brightness.light),
      darkTheme: ulagamTheme(Brightness.dark),
      themeMode: mode,
      home: profile.when(
        data: (value) => value.placementDone ? const HomeShell() : const PlacementPage(),
        loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (error, _) => Scaffold(body: Center(child: Text('Could not open Ulagam. $error'))),
      ),
    );
  }
}
