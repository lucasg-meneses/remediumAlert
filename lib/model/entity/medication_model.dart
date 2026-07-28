import 'package:drift/drift.dart';

class MedicationModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 6, max: 32)();
  IntColumn get time => integer()();
  IntColumn get medicationDosage => integer()();
  TextColumn get medicationDosageUnit => text().withLength(min: 3, max: 16)();
  DateTimeColumn get endAt => dateTime().nullable()();
  DateTimeColumn get startAt => dateTime().nullable()();
}
