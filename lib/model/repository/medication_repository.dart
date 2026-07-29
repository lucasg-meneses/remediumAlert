import 'package:remedium_alert/model/database_helper.dart';
import 'package:remedium_alert/model/entity/medication_model.dart';

class MedicationRepository {
  final dbHelper = DatabaseHelper.instance;
  static const String tableName = 'medications';

  // Create
  Future<int> insert(MedicationModel medication) async {
    final db = await dbHelper.database;
    final map = medication.toMap();
    map.remove('id'); // deixa o SQLite gerar o id
    return await db.insert(tableName, map);
  }

  // Read (todos)
  Future<List<MedicationModel>> getAll() async {
    final db = await dbHelper.database;
    final result = await db.query(tableName, orderBy: 'start_at');
    return result.map((map) => MedicationModel.fromMap(map)).toList();
  }

  // Read (por id)
  Future<MedicationModel?> getById(int id) async {
    final db = await dbHelper.database;
    final maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return MedicationModel.fromMap(maps.first);
    }
    return null;
  }

  // Read (somente medicações ativas, sem end_at ou com end_at no futuro)
  Future<List<MedicationModel>> getAllActive() async {
    final db = await dbHelper.database;
    final agora = DateTime.now().toIso8601String();
    final maps = await db.query(
      tableName,
      where: 'end_at IS NULL OR end_at >= ?',
      whereArgs: [agora],
      orderBy: 'start_at',
    );
    return maps.map((map) => MedicationModel.fromMap(map)).toList();
  }

  // Update
  Future<int> update(MedicationModel medication) async {
    final db = await dbHelper.database;
    return await db.update(
      tableName,
      medication.toMap(),
      where: 'id = ?',
      whereArgs: [medication.id],
    );
  }

  // Delete
  Future<int> delete(int id) async {
    final db = await dbHelper.database;
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Delete todos (útil para testes/reset)
  Future<int> deleteAll() async {
    final db = await dbHelper.database;
    return await db.delete(tableName);
  }
}