import 'dart:async';

// import 'package:async/async.dart';
import 'package:flutter/widgets.dart';
// import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE plant(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      nom_scientifique TEXT,
      nom_vernaculaire TEXT,
      description TEXT,
      localisation TEXT,
      type TEXT
      ) 
    """);
    await database.execute("""CREATE TABLE dog(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      age TEXT
      ) 
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      "d.db",
      version: 1,
      onCreate: (sql.Database database, int version) async {
        debugPrint("...dataBase is creating ... ");
        await createTables(database);
      },
    );
  }

  // ====================================================================================================
  // ========================================   Plants   ================================================
  // ====================================================================================================

  /// Methode utilisee pour ajouter une plante.
  static Future<int> addPlant(
    String? nomScientifique,
    String? nomVernaculaire,
    String? description,
    String? localisation,
    String? type,
  ) async {
    final db = await SqlHelper.db();

    final data = {
      'nom_scientifique': nomScientifique,
      'nom_vernaculaire': nomVernaculaire,
      'description': description,
      'localisation': localisation,
      'type': type
    };
    final id = await db.insert('plant', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  /// Methode utilisee pour recuperer la totalite des plantes.
  static Future<List<Map<String, dynamic>>> getAllPlants() async {
    final db = await SqlHelper.db();
    return db.query("plant", orderBy: 'id');
  }

  /// Methode utilisee pour recuperer une plante.
  static Future<List<Map<String, dynamic>>> getOnePlant(int id) async {
    final db = await SqlHelper.db();
    return db.query("plant", where: "id = ?", whereArgs: [id], limit: 1);
  }

  /// Methode utilisee pour modifier une plante.
  static Future<int> updatePlant(
    int? id,
    String? nomScientifique,
    String? nomVernaculaire,
    String? description,
    String? localisation,
    String? type,
  ) async {
    final db = await SqlHelper.db();

    final data = {
      'nom_scientifique': nomScientifique,
      'nom_vernaculaire': nomVernaculaire,
      'description': description,
      'localisation': localisation,
      'type': type
    };
    final result = db.update("plant", data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  /// Methode utilisee pour supprimer une plante.
  static Future<void> deletePlant(int id) async {
    final db = await SqlHelper.db();
    try {
      await db.delete("plant", where: "id = ?", whereArgs: [id]);
    } catch (e) {
      debugPrint("Error during deleting the item === $e");
    }
  }

  // ====================================================================================================
  // ========================================   Plants   ================================================
  // ====================================================================================================

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
