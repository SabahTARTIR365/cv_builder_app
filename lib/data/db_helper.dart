import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';


class DbHelper {
  late Database database;
  static DbHelper dbHelper = DbHelper();

  final String tableName = "tasks";
  final String idColumnName = "id";
  final String titleColumnName = "title";
  final String isCompleteColumnName = "isComplete";
  initDatabase() async {
    database = await createDatabaseConnection();
  }

  Future<Database> createDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String folderPath = directory.path;
    return openDatabase('$folderPath/tasks.db', version: 1,
        onCreate: (db, version) {
      db.execute('''CREATE TABLE $tableName (
            $idColumnName INTEGER PRIMARY KEY AUTOINCREMENT, 
            $titleColumnName TEXT, 
            $isCompleteColumnName INTEGER)''');
    });
  }


}
