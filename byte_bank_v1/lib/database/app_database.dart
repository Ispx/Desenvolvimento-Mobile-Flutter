import 'package:new_byte_bank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDataBase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, "database.db");
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete
  );
}
