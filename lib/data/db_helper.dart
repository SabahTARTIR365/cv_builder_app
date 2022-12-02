import 'dart:io';

import 'package:cv_builder_app/models/info_model.dart';
import 'package:cv_builder_app/models/work_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';


class DbHelper {
  late Database database;
  static DbHelper dbHelper = DbHelper();

  final String infoTableName = 'info';

  final String nameColumnName = 'name';
  final String professionColumnName = 'profession';
  final String phoneNoColumnName = 'phoneNo';
  final String emailColumnName = 'email';
  final String addressColumnName = 'address';
  final String linkedinLinkColumnName = 'linkedinLink';

  final String workTableName = 'work';

  final String titleColumnName='title';
  final String companyColumnName='company';
  final String locationColumnName='location';
  final String startDateColumnName='startDate';
  final String endDateColumnName='endDate';
  final String achievementColumnName='achievement';



  initDatabase() async {
    database = await createDatabaseConnection();
  }

  Future<Database> createDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String folderPath = directory.path;
    return openDatabase('$folderPath/tasks.db', version: 1,
        onCreate: (db, version) {
          db.execute('''CREATE TABLE $infoTableName (
            $phoneNoColumnName TEXT,
            $nameColumnName TEXT, 
            $professionColumnName TEXT, 
            $emailColumnName TEXT, 
            $addressColumnName TEXT, 
            $linkedinLinkColumnName TEXT)''');

          db.execute('''CREATE TABLE $workTableName (
            $titleColumnName TEXT,
            $companyColumnName TEXT, 
            $locationColumnName TEXT, 
            $startDateColumnName TEXT, 
            $endDateColumnName TEXT, 
            $achievementColumnName TEXT)''');

          print('created table');
        });
  }


  Future<int> insertNewInfo(InfoModel? infoModel) async {
    int i = await database.insert(infoTableName, infoModel!.toMap());
    return i;
  }

  Future<int> insertNewWork(WorkModel? workModel) async {
    int i = await database.insert(workTableName, workModel!.toMap());
    return i;
  }

}