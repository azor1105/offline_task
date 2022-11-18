// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// import 'cached_user_model.dart';
//
// class LocalDataBase {
//   static final LocalDataBase getInstance = LocalDataBase._init();
//   LocalDataBase._init();
//   static Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     } else {
//       _database = await _initDB("cached_users.db");
//       return _database!;
//     }
//   }
//
//   Future<Database> _initDB(String fileName) async {
//     final dbPath = await getDatabasesPath();
//     final String totalPath = join(dbPath, fileName);
//     return await openDatabase(totalPath, version: 1, onCreate: _createDB);
//   }
//
//   Future _createDB(Database db, int version) async {
//     const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
//     const textType = "TEXT NOT NULL";
//     const intType = "INTEGER NOT NULL";
//
//     await db.execute('''
//     CREATE TABLE ${CachedUserFields.tableName}(
//       ${CachedUserFields.id} $idType,
//       ${CachedUserFields.name} $textType,
//       ${CachedUserFields.age} $intType
//     )
//     ''');
//   }
//
//   static Future<List<CachedUserModel>> getAllCachedUsers() async {
//     final db = await getInstance.database;
//     final users = await db.query(CachedUserFields.tableName);
//     return users.map((e) => CachedUserModel.fromJson(json: e)).toList();
//   }
//
//   static Future<int> insertUser(
//       {required String name, required int age}) async {
//     final db = await getInstance.database;
//     return db.insert(
//       CachedUserFields.tableName,
//       CachedUserModel(age: age, name: name).toJson(),
//     );
//   }
//
//   static Future<void> deleteAllUsers() async {
//     final db = await getInstance.database;
//     await db.delete(CachedUserFields.tableName);
//   }
// }
