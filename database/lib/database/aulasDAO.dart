import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class aulasDAO {
  Future<Database> open() async {
    return openDatabase(
      join(await getDatabasesPath(), 'database.db'),
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE aulas(id INTEGER PRIMARY KEY, nome TEXT, status INTEGER)');
      },
      version: 1,
    );
  }

  Future<Database> save(String aula, int status) {
    Map<String, dynamic> map = Map();
    map['nome'] = aula;
    map['status'] = status;

    return open().then((database) {
      database.insert('aulas', map);
    });
  }

  Future<List<dynamic>> find() async {
    Database db = await open();
    List<Map<String, dynamic>> map;
    List<String> lista = List();

    map = await db.query('aulas');

    map.forEach((element) {
      lista.add(element.toString());
    });
    return lista;
  }

  deleteById(int id) {
    open().then((database) {
      //nome da tabela, nome da coluna de referência a ser deletado, valor presente na coluna a ser deletadoo
      database.delete('aulas', where: 'id = ?', whereArgs: [id]);
    });
  }

  deleteByStatus(int status) {
    open().then((database) {
      //nome da tabela, nome da coluna de referência a ser deletado, valor presente na coluna a ser deletado
      database.delete('aulas', where: 'status = ?', whereArgs: [status]);
    });
  }

  deleteByName(String name) {
    open().then((database) {
      //nome da tabela, nome da coluna de referência a ser deletado, valor presente na coluna a ser deletado
      database.delete('aulas', where: 'nome = ?', whereArgs: [name]);
    });
  }

  updateById(int id) {
    open().then((database) {
      //Objeto map para recebe como chave o nome da coluna e como valor o novo valor presente na coluna
      Map<String, dynamic> newDate = Map();
      //Atribuindo novos valores as colunas 'nome' e 'status'
      newDate['nome'] = 'Historia';
      newDate['status'] = 1;
      //nome da tabela, map com valores atualizados (coluna/valor), nome da coluna de referência a ser atualizada, valor da coluna a ser atualizado
      database.update('aulas', newDate, where: 'id = ?', whereArgs: [id]);
    });
  }

  updateByName({String name, status}) {
    open().then((database) {
      //Objeto map para recebe como chave o nome da coluna e como valor o novo valor presente na coluna
      Map<String, dynamic> newDate = Map();
      newDate['status'] = status;
      //nome da tabela, map com valores atualizados (coluna/valor), nome da coluna de referência a ser atualizada, valor da coluna a ser atualizado
      database.update('aulas', newDate, where: 'nome = ?', whereArgs: [name]);
    });
  }
}
