import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'cached_nb_model.dart';

class LocalDataBase {
  static final LocalDataBase getInstance = LocalDataBase._init();
  LocalDataBase._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("cached_nb.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final String totalPath = join(dbPath, fileName);
    return await openDatabase(totalPath, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";

    await db.execute('''
    CREATE TABLE ${CachedNBFields.tableName}(
      ${CachedNBFields.id} $idType,
      ${CachedNBFields.cbPrice} $textType,
      ${CachedNBFields.code} $textType,
      ${CachedNBFields.title} $textType,
      ${CachedNBFields.date} $textType,
    )
    ''');
  }

  static Future<List<CachedCurrencyModel>> getAllCachedCurrency() async {
    final db = await getInstance.database;
    final users = await db.query(CachedNBFields.tableName);
    return users.map((e) => CachedCurrencyModel.fromJson(json: e)).toList();
  }

  static Future<void> deleteAllCurrency() async {
    final db = await getInstance.database;
    await db.delete(CachedNBFields.tableName);
  }

  static Future<void> insertUser(
      {required List<CachedCurrencyModel> currencies}) async {
    final db = await getInstance.database;
    for (var currency in currencies) {
      await db.insert(
        CachedNBFields.tableName,
        currency.toJson(),
      );
    }
  }
}
