import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home -> roda, ezte parâmetro chama o layout principal
        home: LayoutPrincipal());
  }
}

class LayoutPrincipal extends StatefulWidget {
  LayoutPrincipal({Key key}) : super(key: key);

  //Este método que cria o estado do layout para apresentação na tela
  @override
  LayoutPrincipalState createState() => LayoutPrincipalState();
}

//A classe abaixo cria o que será apresentado na tela
class LayoutPrincipalState extends State<LayoutPrincipal> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hellow Word',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
