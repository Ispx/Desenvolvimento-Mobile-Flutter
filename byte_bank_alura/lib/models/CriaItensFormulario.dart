import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Transferencia.dart';

class CriaItensFormulario extends StatelessWidget {
  TextEditingController editingController1;
  TextEditingController editingController2;
  TextInputType textInputType1;
  TextInputType textInputType2;
  InputDecoration textInputDecoration1;
  InputDecoration textInputDecoration2;
  Transferencia transferencia;

  CriaItensFormulario(this.transferencia,
      {this.editingController1,
      this.textInputType1,
      this.textInputDecoration1,
      this.editingController2,
      this.textInputType2,
      this.textInputDecoration2});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        //Capturando o valor de input através do atributo controller
        controller: editingController1,
        keyboardType: textInputType1,
        decoration: textInputDecoration1,
      ),
      TextField(
        //Capturando o valor de input através do atributo controller
        controller: editingController2,
        keyboardType: textInputType2,
        decoration: textInputDecoration2,
      ),
    ]);
  }
}
