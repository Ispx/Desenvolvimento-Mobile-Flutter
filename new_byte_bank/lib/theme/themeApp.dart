import 'package:flutter/material.dart';

themeApp() {
  return ThemeData(
      primaryColor: Colors.green[900],
      primaryColorDark: Colors.black,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.green[900]),
      backgroundColor: Colors.green[300]);
}
