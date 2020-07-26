import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ListaDeTransferenciaWidget.dart';

class Login extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        padding: EdgeInsets.only(top: 200),
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 0, left: 0, top: 60, bottom: 40),
        decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7),
              topRight: Radius.circular(7),
              bottomLeft: Radius.circular(7),
              bottomRight: Radius.circular(7)),
        ),
        child: Column(
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: "Bem vindo ao\n",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: Colors.blue)),
                  TextSpan(
                      text: "     Byte Bank!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: Colors.white)),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 90),
            RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ListaDeTransferenciaWidget();
                  }));
                },
                color: Colors.blue,
                disabledColor: Colors.blue,
                highlightColor: Colors.green,
                padding:
                    EdgeInsets.only(right: 50, left: 50, top: 15, bottom: 15),
                splashColor: Colors.green,
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Entrar",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
