
import 'package:dev/models/contato.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

  const String tableSql = 'CREATE TABLE contato('
    'id INTEGER PRIMARY KEY,'
    'nome TEXT,'
    'numero INTEGER)';

Future<int> save(Contato contato) async{

  final Database db = await getDatabase();
  final Map<String, dynamic> contatoMap = Map();
  contatoMap['nome'] = contato.nome;
  contatoMap['numero'] = contato.numero;
  return db.insert('contato', contatoMap);


  // return getdDataBase().then((db) {
  //   final Map<String, dynamic> contatoMap = Map();
  //   contatoMap['nome'] = contato.nome;
  //   contatoMap['numero'] = contato.numero;
  //   return db.insert('contato', contatoMap);
  // });
}

Future<List<Contato>> FindAll() async {
  final Database db = await getDatabase();
  final List<Map<String,dynamic>> result = await db.query('contato');
  final List<Contato> contatos = [];
  for (Map<String, dynamic> row in result) {
    final Contato contato = Contato(row['nome'], row['numero'], row['id']);
    contatos.add(contato);
  }

  return contatos;
  // return getDatabase().then((db) {
  //   return db.query('contato').then((maps) {
  //   });
  // });
}
