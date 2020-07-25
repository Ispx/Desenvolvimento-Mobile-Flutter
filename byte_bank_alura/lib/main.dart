import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
    );
  }
}

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

class ListaDeTransferenciaWidget extends StatefulWidget {
  final List<Transferencia> listaTransferencias = new List();
  @override
  State<StatefulWidget> createState() {
    return ListaDeTransferenciaWidgetState();
  }
}

class ListaDeTransferenciaWidgetState
    extends State<ListaDeTransferenciaWidget> {
  @override
  Widget build(BuildContext context) {
    // widget.listaTransferencias.add(Transferencia(100, 0001234));
    // widget.listaTransferencias.add(Transferencia(250, 0004567));
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Transações"),
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
          decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.all(Radius.circular(7))),
          margin: EdgeInsets.only(left: 0, right: 0, top: 6, bottom: 80),
          child: ListView.builder(
            itemCount: widget.listaTransferencias.length,
            itemBuilder: (context, i) {
              Transferencia transferencia = widget.listaTransferencias[i];
              return transferencia.build(context);
            },
          )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blue[900],
          onPressed: () {
            final Future<Transferencia> future =
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioDeTrasferenciaWidget();
            }));
            //Função que captura o valor de retorno da outra tela
            future.then((transferenciaCapturada) {
              //Função para delayed de atualização da lista
              Future.delayed(Duration(seconds: 1), () {
                //Chamando o build para executar a lista de transferência
                setState(() {
                  if (transferenciaCapturada != null) {
                    widget.listaTransferencias.add(transferenciaCapturada);
                  }
                });
              });
            });
          }),
    );
  }
}

class FormularioDeTrasferenciaWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Transação",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        child: Formulario(),
      ),
    );
  }
}

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
