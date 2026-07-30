import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('remedium_alert.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
      onUpgrade: _upgradeDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE medications (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        medication_dosage INTEGER NOT NULL,
        medication_dosage_unit TEXT NOT NULL,
        medication_interval INTEGER NOT NULL,
        start_at TEXT NOT NULL,
        medication_last_dosage_at TEXT,
        end_at TEXT
      )
    ''');
  }

  Future<void> _upgradeDB(Database db, int oldVersion, int newVersion) async {
    // Quando você mudar a estrutura das tabelas no futuro,
    // incremente a `version` acima e trate a migração aqui.
    // Exemplo:
    // if (oldVersion < 2) {
    //   await db.execute('ALTER TABLE medications ADD COLUMN notes TEXT');
    // }
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }
}