import 'dart:developer';

import 'package:sqflite/sqflite.dart';

class MyDatabaseHelper {
  MyDatabaseHelper._();

  static MyDatabaseHelper instance = MyDatabaseHelper._();
  static late Database database;

  static String TABLE_NAME = 'address';
  static initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + "demo.db";
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE  $TABLE_NAME(id INTEGER PRIMARY KEY, name TEXT, mobNo INTEGER, address TEXT,landmark TEXT,pincode INTEGER)');
    });
  }

  static Future<int> insertData(String query) async {
    log("call");
    return await database.rawInsert(query);
  }

  static Future<List<Map<String, Object?>>> readData(String query) async {
    return await database.rawQuery(query);
  }

  static Future<int> updateData(String query) async {
    return await database.rawUpdate(query);
  }

  static Future<int> deleteData(String query) async {
    return await database.rawDelete(query);
  }
}
