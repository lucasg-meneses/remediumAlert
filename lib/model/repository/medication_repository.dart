import 'package:remedium_alert/model/database_helper.dart';
import 'package:remedium_alert/model/entity/medication_model.dart';

class MedicationRepository {
  final dbHelper = DatabaseHelper.instance;
  static const String tableName = 'medications';

  // Create
  Future<int> inserir(MedicationModel medication) async {
    final db = await dbHelper.database;
    final map = medication.toMap();
    map.remove('id'); // deixa o SQLite gerar o id
    return await db.insert(tableName, map);
  }

  // Read (todos)
  Future<List<MedicationModel>> buscarTodos() async {
    final db = await dbHelper.database;
    final result = await db.query(tableName, orderBy: 'start_at');
    return result.map((map) => MedicationModel.fromMap(map)).toList();
  }

  // Read (por id)
  Future<MedicationModel?> buscarPorId(int id) async {
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
  Future<List<MedicationModel>> buscarAtivos() async {
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
  Future<int> atualizar(MedicationModel medication) async {
    final db = await dbHelper.database;
    return await db.update(
      tableName,
      medication.toMap(),
      where: 'id = ?',
      whereArgs: [medication.id],
    );
  }

  // Delete
  Future<int> deletar(int id) async {
    final db = await dbHelper.database;
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Delete todos (útil para testes/reset)
  Future<int> deletarTodos() async {
    final db = await dbHelper.database;
    return await db.delete(tableName);
  }
}