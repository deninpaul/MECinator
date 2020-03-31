import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import '../Utils/model.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'localdb.db';
    var db =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return db;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE dataTable (name TEXT, hostel TEXT, clas TEXT, gen TEXT, place TEXT, rep TEXT,house TEXT, region TEXT, ds TEXT, rel TEXT, school TEXT, specs TEXT, singer TEXT, dancer TEXT, programmer TEXT, sports TEXT, musical TEXT, meme TEXT, creative TEXT, drawing TEXT, speaker TEXT, actor TEXT)');
  }

  Future<List<Map<String, dynamic>>> getDataMapList() async {
    Database db = await this.database;

    var result = await db.query('dataTable');
    return result;
  }

  Future<List<Person>> getDataList() async {
    var dataMapList = await getDataMapList();
    int count = dataMapList.length;

    List<Person> dataList = List<Person>();
    for (int i = 0; i < count; i++) {
      dataList.add(Person.fromMapObject(dataMapList[i]));
    }
    return dataList;
  }

  Future<int> insertNote(Person per) async {
    Database db = await this.database;
    var result = await db.insert('dataTable', per.toMap());
    return result;
  }
}
