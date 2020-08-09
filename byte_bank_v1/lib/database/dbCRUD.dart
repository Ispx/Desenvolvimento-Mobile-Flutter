import 'package:new_byte_bank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

import 'app_database.dart';

class dbCrud {
  final String tableName = "contacts";
  final String columnId = "id";
  final String columnName = "name";
  final String columnAccount = "account_number";

  Future<int> save(Contact contact) async {
    Database db = await createDataBase();
    Map<String, dynamic> mapDb = new Map();

    mapDb[columnName] = contact.nome;
    mapDb[columnAccount] = contact.conta;
    return db.insert(tableName, mapDb);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await createDataBase();
    final List<Map<String, dynamic>> result = await db.query(tableName);
    final List<Contact> listContacts = List();

    for (Map<String, dynamic> map in result) {
      final Contact contact = new Contact(
        id: map[columnId],
        nome: map[columnName],
        conta: map[columnAccount],
      );
      listContacts.add(contact);
    }
    return listContacts;
  }

  Future<int> delete(int id) async {
    Database db = await createDataBase();
    return await db.delete(tableName, where: "$columnId = ?", whereArgs: [id]);
  }
}
