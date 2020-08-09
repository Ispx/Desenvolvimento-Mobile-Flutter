import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_byte_bank/database/app_database.dart';
import 'package:new_byte_bank/database/dbCRUD.dart';
import 'package:new_byte_bank/models/contact.dart';
import 'package:new_byte_bank/screens/list_contacts.dart';

class form extends StatefulWidget {
  @override
  _formState createState() => _formState();
}

class _formState extends State<form> {
  final dbCrud db = dbCrud();
  final TextEditingController nome_controller = new TextEditingController();

  final TextEditingController conta_controller = new TextEditingController();

  myTextFild(BuildContext context, String labelText, TextInputType inputType,
      TextEditingController controller) {
    return TextField(
      controller: controller,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      keyboardType: inputType,
    );
  }

  Widget build(BuildContext context) {
    const title = Text(
      'Formulário',
      style: TextStyle(color: Colors.white),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: title,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            myTextFild(context, 'Nome', TextInputType.text, nome_controller),
            myTextFild(
                context, 'Nº Conta', TextInputType.number, conta_controller),
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "Salvar",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    final String nome = nome_controller.text;
                    final int conta = int.tryParse(conta_controller.text);

                    if (nome != null && conta != null) {
                      Contact newContact =
                          new Contact(nome: nome, conta: conta);
                      debugPrint(
                          "Formulario conta: " + newContact.conta.toString());
                      db.save(newContact).then((value) =>
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (contex) => listContacts())));
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
