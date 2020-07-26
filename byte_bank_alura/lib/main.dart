import 'package:byte_bank_alura/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'models/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme(),
      home: Login(),
    );
  }
}
