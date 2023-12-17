import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool isDark = false;
  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  ThemeData get currentTheme => isDark ? ThemeData.dark() : ThemeData.light();

  Color get currentColor => isDark ? Colors.black : Colors.white;

  Color get bgColor => isDark
      ? const Color.fromARGB(171, 11, 10, 10)
      : const Color.fromARGB(119, 186, 169, 169);
}
