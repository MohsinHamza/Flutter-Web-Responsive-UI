import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:next_door/style/style.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.white,
    hintColor: Palette.GREY_LIGHT_MORE,
    cardColor: Colors.grey.shade900,
    canvasColor: Colors.black,
    shadowColor: Colors.black26,
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(color: Colors.orangeAccent, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    cardColor: Palette.WHITE,
    shadowColor: Colors.grey[100]!,
    canvasColor: Palette.WHITE,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors.black, opacity: 0.8),
  );
}