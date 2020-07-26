import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CriaItensFormulario.dart';
import 'Transferencia.dart';

class Formulario extends StatelessWidget {
  CriaItensFormulario criaItensFormulario;
  Transferencia transferencia;
  TextEditingController _InputNumConta = TextEditingController();
  TextEditingController _InputValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    criaItensFormulario = new CriaItensFormulario(
      transferencia,
      editingController1: _InputNumConta,
      textInputType1: TextInputType.number,
      textInputDecoration1: InputDecoration(
        labelText: "Número da conta",
        hintText: "xxxx-xx",
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        hintStyle: TextStyle(color: Colors.grey),
      ),
      editingController2: _InputValor,
      textInputType2: TextInputType.number,
      textInputDecoration2: InputDecoration(
        suffixIcon: Icon(
          Icons.monetization_on,
          size: 36,
          color: Colors.blue,
        ),
        labelText: "Valor",
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        hintText: "0000.00",
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
    return Container(
        margin: EdgeInsets.only(right: 6, left: 6),
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          criaItensFormulario.build(context),
          SizedBox(
            height: 40.0,
          ),
          RaisedButton(
            onPressed: () => {
              if (criaItensFormulario.editingController1.text != null &&
                  _InputValor.text != null)
                {
                  transferencia = new Transferencia(
                      double.tryParse(
                          criaItensFormulario.editingController2.text),
                      int.tryParse(
                          criaItensFormulario.editingController1.text)),
                  debugPrint(
                      "Transferência criada: " + transferencia.getConta()),
                  Navigator.pop(context, transferencia)
                }
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.blue[900],
            textColor: Colors.white,
            highlightColor: Colors.green,
            padding: EdgeInsets.only(right: 45, left: 45, top: 15, bottom: 15),
            child: const Text(
              "Finalizar",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ])));
  }
}
