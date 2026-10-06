import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> getDatabase() async {
    if (_db != null) return _db!;

    final path = join(await getDatabasesPath(), 'notes.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT)',
        );
      },
    );
    return _db!;
  }

  static Future<int> insertNote(String text) async {
    final db = await getDatabase();
    return await db.insert('notes', {'text': text});
  }

  static Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await getDatabase();
    return await db.query('notes');
  }

  static Future<int> deleteNote(int id) async {
    final db = await getDatabase();
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> updateNote(int id, String text) async {
    final db = await getDatabase();
    return await db.update('notes', {'text': text}, where: 'id = ?', whereArgs: [id]);
  }
}