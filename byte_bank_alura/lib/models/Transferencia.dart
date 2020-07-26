import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transferencia extends StatelessWidget {
  Text _valor;
  Text _conta;

  Transferencia(double valor, int conta) {
    this._valor = Text(
      "R\$ " + valor.toString(),
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    );

    this._conta = Text(
      "conta: " + conta.toString(),
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blue,
        child: ListTile(
          leading: Icon(
            Icons.monetization_on,
            color: Colors.yellowAccent,
          ),
          title: _valor,
          subtitle: _conta,
        ));
  }

  String getConta() {
    return this._conta.toString();
  }

  String getValor() {
    return this._valor.toString();
  }
}
