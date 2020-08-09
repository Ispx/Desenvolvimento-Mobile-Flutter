import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_byte_bank/database/dbCRUD.dart';
import 'package:new_byte_bank/models/contact.dart';
import 'package:new_byte_bank/screens/cardContacts.dart';
import 'package:new_byte_bank/screens/form.dart';

class listContacts extends StatefulWidget {
  @override
  _listContactsState createState() => _listContactsState();
}

class _listContactsState extends State<listContacts> {
  final dbCrud db = dbCrud();
  final title = Text(
    'Lista de Contatos',
    style: TextStyle(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: title,
      ),
      body: FutureBuilder<List<Contact>>(
          initialData: List(),
          future: Future.delayed(Duration(seconds: 2))
              .then((value) => db.findAll()),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                // TODO: Handle this case.
                break;

              case ConnectionState.waiting:
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                ));
                break;

              case ConnectionState.active:
                // TODO: Handle this case.

                break;

              case ConnectionState.done:
                final List<Contact> contacts = snapshot.data;
                return ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      Contact contact = contacts[index];

                      return cardContacts(contact);
                    });

                break;
            }

            return Center(
              child: Text(
                "Falha inesperada.",
                style: TextStyle(fontSize: 26, color: Colors.red),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (contex) => form()));
          },
          child: Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor),
    );
  }
}
