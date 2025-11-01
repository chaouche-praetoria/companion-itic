import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemeMode { system, light, dark }

class ThemeController {
  ThemeController._();
  static final ThemeController instance = ThemeController._();

  static const _storageKey = 'app_theme_mode';
  final ValueNotifier<AppThemeMode> mode = ValueNotifier(AppThemeMode.system);

  ThemeMode get materialMode => switch (mode.value) {
    AppThemeMode.light => ThemeMode.light,
    AppThemeMode.dark  => ThemeMode.dark,
    _                  => ThemeMode.system
  };

  Future<void> load() async {
    final p = await SharedPreferences.getInstance();
    final saved = p.getString(_storageKey);
    final m = AppThemeMode.values.firstWhere(
          (e) => e.name == saved,
      orElse: () => AppThemeMode.system,
    );
    if (kDebugMode) {
      print(m);
    }
    mode.value = m;
  }

  Future<void> setMode(AppThemeMode m) async {
    mode.value = m;
    final p = await SharedPreferences.getInstance();
    await p.setString(_storageKey, m.name);
  }

  Future<void> toggleLightDark() async {
    final next = (mode.value == AppThemeMode.dark)
        ? AppThemeMode.light
        : AppThemeMode.dark;
    await setMode(next);
  }
}
