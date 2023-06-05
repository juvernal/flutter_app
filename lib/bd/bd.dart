import 'dart:async';

// import 'package:async/async.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
// import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;
// import 'package:sqflite/sqflite.dart';
import '../usefull/Plant.dart';
import '../usefull/fiche.dart';

class SqlHelper {
  static Future<void> createTables(sql.Database database) async {
    // SqlHelper.deletetable();

    await database.execute("""CREATE TABLE plant(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      nom_scientifique TEXT,
      nom_vernaculaire TEXT,
      description TEXT,
      localisation TEXT,
      type TEXT,
      photo TEXT
      ) 
    """);
    await database.execute("""CREATE TABLE fiche(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      nom TEXT,
      age TEXT,
      sexe TEXT,
      lieu TEXT,
      dose_adulte TEXT,
      dose_enfant TEXT,
      dure_preparation TEXT,
      dure_traitement TEXT,
      effet_secondaire TEXT,
      etat TEXT,
      intoxication TEXT,
      maladies TEXT,
      partie TEXT,
      periode_recolte TEXT,
      preparation TEXT,
      quantite_materiel TEXT,
      sacre TEXT,
      sechage TEXT,
      utilisation TEXT,
      type_aliment TEXT,
      type_personne TEXT,
      plant_id INTEGER NOT NULL,
      FOREIGN KEY(plant_id) REFERENCES plant(id)
      ON UPDATE CASCADE
      ON DELETE CASCADE
      ) 
    """);
    await database.execute("""CREATE TABLE dog(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      age TEXT
      ) 
    """);
  }

  static void deletetable() async {
    final db = await SqlHelper.db();
    debugPrint("deleting plant table");
    db.execute("""DELETE FROM plant""");
  }

  static Future<void> deleteDatabase(String path) =>
      sql.databaseFactory.deleteDatabase(path);
  static void del() async {
    String path = join(await sql.getDatabasesPath(), "d.db");
    await deleteDatabase(path);
    debugPrint("deleting Bd");
  }

  static Future<sql.Database> db() async {
    // String path = join(await sql.getDatabasesPath(), "d.db");
    // await deleteDatabase(path);
    // debugPrint("init Bd");
    return sql.openDatabase(
      "d.db",
      version: 1,
      onCreate: (sql.Database database, int version) async {
        debugPrint("...dataBase is creating ... ");
        // SqlHelper.deletetable();
        await createTables(database);
      },
    );
  }

  // ====================================================================================================
  // ========================================   Plants   ================================================
  // ====================================================================================================

  /// Methode utilisee pour ajouter une plante.
  static Future<int> addPlant(Plant p) async {
    final db = await SqlHelper.db();

    final data = {
      'nom_scientifique': p.nomScientifique,
      'nom_vernaculaire': p.nomVernaculaire,
      'description': p.description,
      'localisation': p.localisation,
      'type': p.type,
      'photo': p.photo
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

  static Future<List<Plant>> allPlants() async {
    final db = await SqlHelper.db();
    final list = await db.query("plant", orderBy: 'id');
    return List.generate(list.length, (i) {
      return Plant(
          nomScientifique: list[i]['nom_scientifique'].toString(),
          nomVernaculaire: list[i]['nom_vernaculaire'].toString(),
          description: list[i]['description'].toString(),
          localisation: list[i]['localisation'].toString(),
          photo: list[i]['photo'].toString(),
          type: list[i]['type'].toString());
    });
  }

  /// Methode utilisee pour recuperer une plante.
  static Future<List<Map<String, dynamic>>> getOnePlant(int id) async {
    final db = await SqlHelper.db();
    return db.query("plant", where: "id = ?", whereArgs: [id], limit: 1);
  }

  /// Methode utilisee pour modifier une plante.
  static Future<int> updatePlant(Plant p) async {
    final db = await SqlHelper.db();

    final data = {
      'nom_scientifique': p.nomScientifique,
      'nom_vernaculaire': p.nomVernaculaire,
      'description': p.description,
      'localisation': p.localisation,
      'type': p.type,
      'photo': p.photo
    };
    final result = db.update("plant", data, where: "id = ?", whereArgs: [p.id]);
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
  // ========================================   fiches   ================================================
  // ====================================================================================================

  //ADD A NEW FICHE TO DATABASE
  static Future<int> addFiche(Fiche f) async {
    final db = await SqlHelper.db();

    final data = {
      'nom': f.nom,
      'age': f.age,
      'sexe': f.sex,
      'lieu': f.lieu,
      'dose_adulte': f.doseAdulte,
      'dose_enfant': f.doseEnfant,
      'dure_preparation': f.duree,
      'dure_traitement': f.dureTraitement,
      'effet_secondaire': f.effetSecondaire,
      'etat': f.etat,
      'intoxication': f.intoxication,
      'maladies': f.maladies,
      'partie': f.partie,
      'periode_recolte': f.periodeRecolte,
      'preparation': f.preparation,
      'quantite_materiel': f.quatiteMateriel,
      'sacre': f.sacre,
      'sechage': f.sechage,
      'utilisation': f.utilisation,
      'type_aliment': f.typeAliment,
      'type_personne': f.typePerson,
      'plant_id': f.plantID,
    };
    final id = await db.insert('fiche', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  /// Methode utilisee pour modifier une fiche.
  static Future<int> updateFiche(Fiche f) async {
    final db = await SqlHelper.db();

    final data = {
      'nom': f.nom,
      'age': f.age,
      'sexe': f.sex,
      'lieu': f.lieu,
      'dose_adulte': f.doseAdulte,
      'dose_enfant': f.doseEnfant,
      'dure_preparation': f.duree,
      'dure_traitement': f.dureTraitement,
      'effet_secondaire': f.effetSecondaire,
      'etat': f.etat,
      'intoxication': f.intoxication,
      'maladies': f.maladies,
      'partie': f.partie,
      'periode_recolte': f.periodeRecolte,
      'preparation': f.preparation,
      'quantite_materiel': f.quatiteMateriel,
      'sacre': f.sacre,
      'sechage': f.sechage,
      'utilisation': f.utilisation,
      'type_aliment': f.typeAliment,
      'type_personne': f.typePerson,
      'plant_id': f.plantID,
    };
    final result = db.update("fiche", data, where: "id = ?", whereArgs: [f.id]);
    return result;
  }

  /// Methode utilisee pour supprimer une fiche.
  static Future<void> deleteFiche(int id) async {
    final db = await SqlHelper.db();
    try {
      await db.delete("fiche", where: "id = ?", whereArgs: [id]);
    } catch (e) {
      debugPrint("Error during deleting the item === $e");
    }
  }

  /// Methode utilisee pour recuperer la totalite des fiche.
  static Future<List<Map<String, dynamic>>> getAllFiches() async {
    final db = await SqlHelper.db();
    return db.query("fiche", orderBy: 'id');
  }

  /// Methode utilisee pour recuperer une fiche.
  static Future<List<Map<String, dynamic>>> getOneFiche(int id) async {
    final db = await SqlHelper.db();
    return db.query("fiche", where: "id = ?", whereArgs: [id], limit: 1);
  }

  /// Methode utilisee pour recuperer les fiches d'une plante.
  static Future<List<Map<String, dynamic>>> getPlantesFiche(
      int? plantID) async {
    final db = await SqlHelper.db();
    return db.query("fiche", where: "plant_id = ?", whereArgs: [plantID]);
  }
}
