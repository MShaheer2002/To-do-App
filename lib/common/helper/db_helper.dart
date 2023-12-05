import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';

class DBhelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(join(dbPath, "todolist.db"),
        onCreate: (db, version) => createTable(db), version: 1);
  }

  static void createTable(sql.Database db) {
    db.execute(
        'Create Table task(id Text Primary key, title Text, description Text,Color INTEGER)');
    db.execute(
        'Create Table Completed(id Text Primary key, title Text, description Text,Color INTEGER)');
  }

  static Future<void> onInsert(String table, Map<String, dynamic> data) async {
    final db = await DBhelper.database();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> onDelete(String table, id) async {
    final db = await DBhelper.database();
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBhelper.database();
    return db.query(table);
  }

  static Future<List<Map<String, dynamic>>> getSpecifiedData(int color) async {
    final db = await DBhelper.database();
    return db.rawQuery("Select * from task where Color == $color");
  }
}
