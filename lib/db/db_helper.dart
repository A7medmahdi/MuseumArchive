import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled1/Models/item_Info.dart';

import '../Controllers/CategoryController.dart';
import '../Data/dummy_data.dart';

class DBHelper {
  static CategoryController controllers = Get.put(CategoryController());
  static Database? _database;
  static const int _version = 1;
  static const String itemTableName = 'ItemInfo';
  static const String categoryTableName = 'Category';
  static const String _sql = '''
      CREATE TABLE $itemTableName (
      id INTEGER ,
      name TEXT,
      museumNumber TEXT,
      storeNumber TEXT,
      details TEXT,
      category INTEGER,
      manufacturersName TEXT,
      Date TEXT,
      material TEXT,
      special INTEGER DEFAULT '0',
      PRIMARY KEY("ID" AUTOINCREMENT)
      ) ;
      ''';
  static const String sql2 = '''
      CREATE TABLE  $categoryTableName(
      id INTEGER ,
      title TEXT,
      color TEXT,
      PRIMARY KEY("id" AUTOINCREMENT)
       ); ''';

  static Future<void> initDatabase() async {
    if (_database != null) {
      debugPrint("Database is execute");
      return;
    } else {
      try {
        String path = '${await getDatabasesPath()} MuseumItems.db';
        _database = await openDatabase(path, version: _version,
            onCreate: (Database db, int version) async {
              await db.execute(sql2);
              await db.execute(_sql);
        });
        // await controllers.initStateA();
        // debugPrint("initializedCategoryTable");
      } catch (ex) {
        debugPrint(ex.toString());
      }
    }
  }

  static Future<int> insert(item,String tableName) async {
    return await _database!.insert(tableName, item.toJson());
  }

  static Future<int> deleteAll(ItemInfo? item,String tableName) async {
    return await _database!.delete(tableName);
  }

  static Future<int> delete(ItemInfo item,String tableName) async {
    return await _database!
        .delete(tableName, where: 'id = ?', whereArgs: [item.id]);
  }

  static Future<int> update( item,String tableName) async {
    return await _database!.update(tableName, item.toJson(),
        where: 'id = ?', whereArgs: [item.id]);
  }

  static Future<List<Map<String, dynamic>>> query(String tableName) async {
      return await _database!.query(tableName);
  }

  static Future<List<Map<String, dynamic>>> likeQuery(String tableName,String columnName,String input) async {
    String query = "SELECT * FROM $tableName t WHERE t.$columnName LIKE '%$input%'";
    return await _database!.rawQuery(query);
  }

  static Future<String> rawQuery(String tableName,int id) async {
    var str = await _database!.rawQuery("SELECT t.path FROM $tableName t WHERE t.itemId = $id");
    return str.first["path"] as String;
  }

  static Future<void> updateQuery(String query) async {
      await _database!.execute(query);
  }

 static Future<void> initStatea() async {
    DUMMY_CATEGORIES.forEach((element) async {
      var cat = await DBHelper.insert(element, DBHelper.categoryTableName);
      debugPrint(element.title);
    });
  }
}
