import 'package:drift/drift.dart';

class MedicationModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 6, max: 32)();
  IntColumn get time => integer()();
  IntColumn get frequency => integer()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get endAt => dateTime().nullable()();
}
