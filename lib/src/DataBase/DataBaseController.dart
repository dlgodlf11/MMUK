import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mmuk/src/DataBase/ingredients-ground-Model.dart';
import 'package:mmuk/src/DataBase/ingredients-processed-Model.dart';
import 'package:mmuk/src/DataBase/ingredients-water-Model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseController extends GetxController {
  late final Database db_Processed;
  late final Database db_Ground;
  late final Database db_Water;
  final String _createQuery_Processed = '''
CREATE TABLE processed(
    id TEXT PRIMARY KEY,
    ingredient TEXT NOT NULL,
    maker TEXT NOT NULL,
    category TEXT NOT NULL,
    detail_category TEXT NOT NULL,
    unit_quantity TEXT NOT NULL,
    unit TEXT NOT NULL,
    all_quantity_g TEXT NOT NULL,
    all_quantity_ml TEXT NOT NULL,
    calories TEXT NOT NULL,
    moisture TEXT NOT NULL,
    protein TEXT NOT NULL,
    fat TEXT NOT NULL,
    carbonhydrate TEXT NOT NULL,
    sugar TEXT NOT NULL,
    salt TEXT NOT NULL,
    colesterol TEXT NOT NULL,
    fatty_acid TEXT NOT NULL,
    trans_fatty_acid TEXT NOT NULL,
    unsaturated_fatty_acid REAL NOT NULL,
    source TEXT NOT NULL,
    issuer TEXT NOT NULL
)
''';
  final String _createQuery_Ground = '''
CREATE TABLE ground(
    id TEXT PRIMARY KEY,
    ingredient TEXT NOT NULL,
    category TEXT NOT NULL,
    unit_quantity TEXT NOT NULL,
    unit TEXT NOT NULL,
    calories TEXT NOT NULL,
    moisture TEXT NOT NULL,
    protein TEXT NOT NULL,
    fat TEXT NOT NULL,
    carbonhydrate TEXT NOT NULL,
    sugar TEXT NOT NULL,
    fiber TEXT NOT NULL,
    amino_acid TEXT NOT NULL,
    colesterol TEXT NOT NULL,
    fatty_acid TEXT NOT NULL,
    unsaturated_fatty_acid REAL NOT NULL,
    trans_fatty_acid TEXT NOT NULL,
    source TEXT NOT NULL,
    issuer TEXT NOT NULL
)
''';

  final String _createQuery_Water = '''
CREATE TABLE water(
    id TEXT PRIMARY KEY,
    ingredient TEXT NOT NULL,
    location TEXT NOT NULL,
    catch_month TEXT NOT NULL,
    category TEXT NOT NULL,
    unit_quantity TEXT NOT NULL,
    unit TEXT NOT NULL,
    calories TEXT NOT NULL,
    moisture TEXT NOT NULL,
    protein TEXT NOT NULL,
    fat TEXT NOT NULL,
    carbonhydrate TEXT NOT NULL,
    fiber TEXT NOT NULL,
    calcium TEXT NOT NULL,
    amino_acid TEXT NOT NULL,
    source TEXT NOT NULL,
    issuer TEXT NOT NULL
)
''';
  @override
  void onInit() async {
    // TODO: implement onInit
    db_Processed = await loadDB('ingredients_processed.db');
    await saveDBfromCSV(db_Processed, _createQuery_Processed,
        "assets/ingredients-processed.csv", "processed");

    db_Ground = await loadDB('ingredients_ground.db');
    await saveDBfromCSV(db_Ground, _createQuery_Ground,
        "assets/ingredients-ground.csv", "ground");

    db_Water = await loadDB('ingredients_water.db');
    await saveDBfromCSV(
        db_Water, _createQuery_Water, "assets/ingredients-water.csv", "water");

    super.onInit();
  }

  Future<Database> loadDB(dbName) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        print("create");
      },
    );
    return db;
  }

  saveDBfromCSV(Database db, query, csvFilePath, modelname) async {
    print(db.path);
    try {
      List<Map<String, dynamic>> res = await db
          .query(modelname, where: 'ingredient LIKE ?', whereArgs: ['%%']);
      if (res.length != 0) {
        print("haveData${res.length}");
        return;
      }
    } catch (e) {
      print("noData");
    }
    String filePath = csvFilePath;
    // CSV 파일 읽기
    await rootBundle.loadString(filePath).then(
      (data) async {
        const converter = CsvToListConverter();
        final csvData = converter.convert(data);
        await createDb(db, query);
        for (var i = 1; i < csvData.length; i++) {
          late var ingredientModel;
          switch (modelname) {
            case "ground":
              ingredientModel = IngredientsGroundModel(csvData: csvData[i]);
              break;
            case "processed":
              ingredientModel = IngredientsProcessedModel(csvData: csvData[i]);
              break;
            case "water":
              ingredientModel = IngredientsWaterModel(csvData: csvData[i]);
              break;
            default:
          }

          insertIngredient(db, ingredientModel.toMap(), modelname);
        }
      },
    );
  }

  Future<void> createDb(Database db, query) async {
    db.execute(query);
  }

  Future<void> insertIngredient(
      Database db, Map<String, dynamic> ingredient, String tableName) async {
    // print("++++++++++++++++++++++++++++++");
    // print(ingredient);
    // print("++++++++++++++++++++++++++++++");
    await db.insert(tableName, ingredient);
  }

  Future<List<Map<String, dynamic>>> searchIngredients(
      Database db, String table, String search) async {
    print(search);
    return await db
        .query(table, where: 'ingredient LIKE ?', whereArgs: ['%$search%']);
  }

  Future<List<Map<String, dynamic>>> searchId(
      Database db, String table, String id) async {
    return await db.query(table, where: 'id LIKE ?', whereArgs: ['$id']);
  }
}
