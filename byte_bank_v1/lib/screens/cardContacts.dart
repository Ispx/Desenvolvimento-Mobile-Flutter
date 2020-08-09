import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_byte_bank/models/contact.dart';

class cardContacts extends StatelessWidget {
  Contact contact;
  cardContacts(this.contact);

  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[700],
      child: ListTile(
          title: Text(
            "Nome: " + this.contact.nome,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Conta: " + contact.conta.toString(),
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
