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
        //home -> roda, este parâmetro chama o widget que será exibido na tela, este parâmetro é obrigatório
        home: LayoutPrincipal());
  }
}

class LayoutPrincipal extends StatefulWidget {
  LayoutPrincipal({Key key}) : super(key: key);

  //É a partir do método createState que é chamado a classe que cria os widgets na tela.

  @override
  CriaWidgetsLayout createState() => CriaWidgetsLayout();
}

//A classe abaixo cria os Widgets que serão apresentados na tela
class CriaWidgetsLayout extends State<LayoutPrincipal> {
  //Método construtor de widget
  Widget build(BuildContext context) {
    //Definindo o tipo de Widget pai que irá retornar o layout criado a partir dos wigets filho.
    return Scaffold(
      //Widgets filho
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
