import 'package:dev/models/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path  = join(await getDatabasesPath(), 'bytebanl.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contato('
          'id INTEGER PRIMARY KEY,'
          'nome TEXT,'
          'numero INTEGER)');
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete
  );

  // return getDatabasesPath().then((dbPath) {
  //   final String path = join(dbPath, 'bytebanl.db');
  //   return openDatabase(
  //     path,
  //     onCreate: (db, version) {
  //       db.execute('CREATE TABLE contato('
  //           'id INTEGER PRIMARY KEY,'
  //           'nome TEXT,'
  //           'numero INTEGER)');
  //     },
  //     version: 1,
  //     //onDowngrade: onDatabaseDowngradeDelete
  //   );
  // });
}
