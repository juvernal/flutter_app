import 'dart:async';

// import 'package:async/async.dart';
import 'package:flutter/widgets.dart';
// import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE dog(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      age TEXT
      ) 
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      "dog.db",
      version: 1,
      onCreate: (sql.Database database, int version) async {
        debugPrint("...dataBase is creating ... ");
        await createTables(database);
      },
    );
  }

  static Future<int> addItem(String? name, String? age) async {
    final db = await SqlHelper.db();

    final data = {'name': name, 'age': age};
    final id = await db.insert('dog', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SqlHelper.db();
    return db.query("dog", orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getOneItem(int id) async {
    final db = await SqlHelper.db();
    return db.query("dog", where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(int? id, String? name, String? age) async {
    final db = await SqlHelper.db();

    final data = {'name': name, 'age': age};
    final result = db.update("dog", data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SqlHelper.db();
    try {
      await db.delete("dog", where: "id = ?", whereArgs: [id]);
    } catch (e) {
      debugPrint("Error during deleting the item === $e");
    }
  }
}
