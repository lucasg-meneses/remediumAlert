import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();

    return openDatabase(
      join(dbPath, 'medications.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE medications (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            medication_dosage INTEGER NOT NULL,
            medication_dosage_unit INTEGER NOT NULL,
            medication_interval INTEGER NOT NULL,
            start_at TEXT NOT NULL,
            end_at TEXT
          )
        ''');
      },
    );
  }
}