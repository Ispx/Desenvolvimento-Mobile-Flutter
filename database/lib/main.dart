import 'package:database/database/aulasDAO.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  aulasDAO dao = new aulasDAO();

  //dao.save('Geografia', 1);

  // dao.deleteByName('portugues');

  // dao.updateById(6);

  // dao.updateByName(name: 'Historia', status: 0);

  /*
  dao.find().then((value) {
    value.forEach((element) {
      print(element.toString());
    });
  });
  */
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
      ),
    );
  }
}
