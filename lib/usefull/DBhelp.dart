import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'Plant.dart';

class DBHelper {
   static Database? _db;
  static const String ID = 'id';
  static const String nomScientifique = 'nomScientifique';
  static const String nomVernaculaire= 'nomVernaculaire';
  static const String description = 'description';
  static const String localisation = 'localisation';
  static const String photo = 'photo';
  static const String type = 'type';
  static const String table = 'PlanteTable';
  static const String dbName = 'plantes.db';

  Future<Database> get  getDb async => _db ??= await initDb();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);
    var db = await openDatabase(path, version: 2, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $table ($ID INTEGER PRIMARY KEY NOT NULL, $nomScientifique TEXT, $nomVernaculaire TEXT, $type TEXT, $description TEXT, $localisation TEXT)"
      );
  }
  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion < newVersion) {
      db.execute("ALTER TABLE $table ADD COLUMN $photo TEXT;");
    }
  }
  
  
  Future<List<Plant>> plants() async {
  final db = await getDb;
  final List<Map<String, dynamic>> maps = await db.query(table);
  return List.generate(maps.length, (i) {
    return Plant(
      id: maps[i]['id'],
      nomScientifique: maps[i]['nomScientifique'],
      nomVernaculaire: maps[i]['nomVernaculaire'],
      type: maps[i]['type'],
      description: maps[i]['description'],
      localisation: maps[i]['localisation'],
      photo: maps[i]['photo']
    );
  });
}



  Future<Plant> save(Plant plant) async {
      var db = await getDb;

  await db.insert('PlanteTable', plant.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);
    // debugPrint("success");
    return plant;
  }
  
 
  Future close() async {
    final db = await getDb;
    db.close();
  }
}