import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Formulario.dart';
import 'ListaDeTransferenciaWidget.dart';
import 'Transferencia.dart';

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
