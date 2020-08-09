import 'package:flutter/material.dart';
import 'package:new_byte_bank/screens/dashboard.dart';
import 'package:new_byte_bank/theme/themeApp.dart';

void main() {
  runApp(bytebankApp());
}

class bytebankApp extends StatelessWidget {
  final String title = 'Byte Bank App';

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeApp(),
      home: dashboard(),
      title: title,
    );
  }
}
