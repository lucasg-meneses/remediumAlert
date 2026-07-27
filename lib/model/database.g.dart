// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MedicationModelTable extends MedicationModel
    with TableInfo<$MedicationModelTable, MedicationModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 6,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _frequencyMeta = const VerificationMeta(
    'frequency',
  );
  @override
  late final GeneratedColumn<int> frequency = GeneratedColumn<int>(
    'frequency',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endAtMeta = const VerificationMeta('endAt');
  @override
  late final GeneratedColumn<DateTime> endAt = GeneratedColumn<DateTime>(
    'end_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    time,
    frequency,
    createdAt,
    endAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medication_model';
  @override
  VerificationContext validateIntegrity(
    Insertable<MedicationModelData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(
        _frequencyMeta,
        frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta),
      );
    } else if (isInserting) {
      context.missing(_frequencyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('end_at')) {
      context.handle(
        _endAtMeta,
        endAt.isAcceptableOrUnknown(data['end_at']!, _endAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicationModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicationModelData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      time: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}time'],
      )!,
      frequency: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}frequency'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      endAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_at'],
      ),
    );
  }

  @override
  $MedicationModelTable createAlias(String alias) {
    return $MedicationModelTable(attachedDatabase, alias);
  }
}

class MedicationModelData extends DataClass
    implements Insertable<MedicationModelData> {
  final int id;
  final String name;
  final int time;
  final int frequency;
  final DateTime? createdAt;
  final DateTime? endAt;
  const MedicationModelData({
    required this.id,
    required this.name,
    required this.time,
    required this.frequency,
    this.createdAt,
    this.endAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['time'] = Variable<int>(time);
    map['frequency'] = Variable<int>(frequency);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || endAt != null) {
      map['end_at'] = Variable<DateTime>(endAt);
    }
    return map;
  }

  MedicationModelCompanion toCompanion(bool nullToAbsent) {
    return MedicationModelCompanion(
      id: Value(id),
      name: Value(name),
      time: Value(time),
      frequency: Value(frequency),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      endAt: endAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endAt),
    );
  }

  factory MedicationModelData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicationModelData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      time: serializer.fromJson<int>(json['time']),
      frequency: serializer.fromJson<int>(json['frequency']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      endAt: serializer.fromJson<DateTime?>(json['endAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'time': serializer.toJson<int>(time),
      'frequency': serializer.toJson<int>(frequency),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'endAt': serializer.toJson<DateTime?>(endAt),
    };
  }

  MedicationModelData copyWith({
    int? id,
    String? name,
    int? time,
    int? frequency,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> endAt = const Value.absent(),
  }) => MedicationModelData(
    id: id ?? this.id,
    name: name ?? this.name,
    time: time ?? this.time,
    frequency: frequency ?? this.frequency,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    endAt: endAt.present ? endAt.value : this.endAt,
  );
  MedicationModelData copyWithCompanion(MedicationModelCompanion data) {
    return MedicationModelData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      time: data.time.present ? data.time.value : this.time,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      endAt: data.endAt.present ? data.endAt.value : this.endAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicationModelData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('time: $time, ')
          ..write('frequency: $frequency, ')
          ..write('createdAt: $createdAt, ')
          ..write('endAt: $endAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, time, frequency, createdAt, endAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicationModelData &&
          other.id == this.id &&
          other.name == this.name &&
          other.time == this.time &&
          other.frequency == this.frequency &&
          other.createdAt == this.createdAt &&
          other.endAt == this.endAt);
}

class MedicationModelCompanion extends UpdateCompanion<MedicationModelData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> time;
  final Value<int> frequency;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> endAt;
  const MedicationModelCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.time = const Value.absent(),
    this.frequency = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.endAt = const Value.absent(),
  });
  MedicationModelCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int time,
    required int frequency,
    this.createdAt = const Value.absent(),
    this.endAt = const Value.absent(),
  }) : name = Value(name),
       time = Value(time),
       frequency = Value(frequency);
  static Insertable<MedicationModelData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? time,
    Expression<int>? frequency,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? endAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (time != null) 'time': time,
      if (frequency != null) 'frequency': frequency,
      if (createdAt != null) 'created_at': createdAt,
      if (endAt != null) 'end_at': endAt,
    });
  }

  MedicationModelCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? time,
    Value<int>? frequency,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? endAt,
  }) {
    return MedicationModelCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      time: time ?? this.time,
      frequency: frequency ?? this.frequency,
      createdAt: createdAt ?? this.createdAt,
      endAt: endAt ?? this.endAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<int>(frequency.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (endAt.present) {
      map['end_at'] = Variable<DateTime>(endAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationModelCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('time: $time, ')
          ..write('frequency: $frequency, ')
          ..write('createdAt: $createdAt, ')
          ..write('endAt: $endAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MedicationModelTable medicationModel = $MedicationModelTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [medicationModel];
}

typedef $$MedicationModelTableCreateCompanionBuilder =
    MedicationModelCompanion Function({
      Value<int> id,
      required String name,
      required int time,
      required int frequency,
      Value<DateTime?> createdAt,
      Value<DateTime?> endAt,
    });
typedef $$MedicationModelTableUpdateCompanionBuilder =
    MedicationModelCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> time,
      Value<int> frequency,
      Value<DateTime?> createdAt,
      Value<DateTime?> endAt,
    });

class $$MedicationModelTableFilterComposer
    extends Composer<_$AppDatabase, $MedicationModelTable> {
  $$MedicationModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endAt => $composableBuilder(
    column: $table.endAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MedicationModelTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicationModelTable> {
  $$MedicationModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endAt => $composableBuilder(
    column: $table.endAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MedicationModelTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicationModelTable> {
  $$MedicationModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumn<int> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endAt =>
      $composableBuilder(column: $table.endAt, builder: (column) => column);
}

class $$MedicationModelTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicationModelTable,
          MedicationModelData,
          $$MedicationModelTableFilterComposer,
          $$MedicationModelTableOrderingComposer,
          $$MedicationModelTableAnnotationComposer,
          $$MedicationModelTableCreateCompanionBuilder,
          $$MedicationModelTableUpdateCompanionBuilder,
          (
            MedicationModelData,
            BaseReferences<
              _$AppDatabase,
              $MedicationModelTable,
              MedicationModelData
            >,
          ),
          MedicationModelData,
          PrefetchHooks Function()
        > {
  $$MedicationModelTableTableManager(
    _$AppDatabase db,
    $MedicationModelTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicationModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicationModelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicationModelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> time = const Value.absent(),
                Value<int> frequency = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> endAt = const Value.absent(),
              }) => MedicationModelCompanion(
                id: id,
                name: name,
                time: time,
                frequency: frequency,
                createdAt: createdAt,
                endAt: endAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int time,
                required int frequency,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> endAt = const Value.absent(),
              }) => MedicationModelCompanion.insert(
                id: id,
                name: name,
                time: time,
                frequency: frequency,
                createdAt: createdAt,
                endAt: endAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MedicationModelTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicationModelTable,
      MedicationModelData,
      $$MedicationModelTableFilterComposer,
      $$MedicationModelTableOrderingComposer,
      $$MedicationModelTableAnnotationComposer,
      $$MedicationModelTableCreateCompanionBuilder,
      $$MedicationModelTableUpdateCompanionBuilder,
      (
        MedicationModelData,
        BaseReferences<
          _$AppDatabase,
          $MedicationModelTable,
          MedicationModelData
        >,
      ),
      MedicationModelData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MedicationModelTableTableManager get medicationModel =>
      $$MedicationModelTableTableManager(_db, _db.medicationModel);
}
