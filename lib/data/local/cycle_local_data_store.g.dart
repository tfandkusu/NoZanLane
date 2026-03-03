// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_local_data_store.dart';

// ignore_for_file: type=lint
class $CycleRecordsTable extends CycleRecords
    with TableInfo<$CycleRecordsTable, CycleRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CycleRecordsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startAtMeta = const VerificationMeta(
    'startAt',
  );
  @override
  late final GeneratedColumn<int> startAt = GeneratedColumn<int>(
    'start_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endAtMeta = const VerificationMeta('endAt');
  @override
  late final GeneratedColumn<int> endAt = GeneratedColumn<int>(
    'end_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    startAt,
    endAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cycles';
  @override
  VerificationContext validateIntegrity(
    Insertable<CycleRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('start_at')) {
      context.handle(
        _startAtMeta,
        startAt.isAcceptableOrUnknown(data['start_at']!, _startAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startAtMeta);
    }
    if (data.containsKey('end_at')) {
      context.handle(
        _endAtMeta,
        endAt.isAcceptableOrUnknown(data['end_at']!, _endAtMeta),
      );
    } else if (isInserting) {
      context.missing(_endAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CycleRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CycleRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      startAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_at'],
      )!,
      endAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_at'],
      )!,
    );
  }

  @override
  $CycleRecordsTable createAlias(String alias) {
    return $CycleRecordsTable(attachedDatabase, alias);
  }
}

class CycleRecord extends DataClass implements Insertable<CycleRecord> {
  /// プライマリーID。
  final int id;

  /// 作成日時（UNIX ミリ秒）。
  final int createdAt;

  /// 更新日時（UNIX ミリ秒）。
  final int updatedAt;

  /// サイクル開始日時（UNIX ミリ秒）。
  final int startAt;

  /// サイクル終了日時（UNIX ミリ秒）。
  final int endAt;
  const CycleRecord({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.startAt,
    required this.endAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    map['start_at'] = Variable<int>(startAt);
    map['end_at'] = Variable<int>(endAt);
    return map;
  }

  CycleRecordsCompanion toCompanion(bool nullToAbsent) {
    return CycleRecordsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      startAt: Value(startAt),
      endAt: Value(endAt),
    );
  }

  factory CycleRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CycleRecord(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      startAt: serializer.fromJson<int>(json['startAt']),
      endAt: serializer.fromJson<int>(json['endAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'startAt': serializer.toJson<int>(startAt),
      'endAt': serializer.toJson<int>(endAt),
    };
  }

  CycleRecord copyWith({
    int? id,
    int? createdAt,
    int? updatedAt,
    int? startAt,
    int? endAt,
  }) => CycleRecord(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    startAt: startAt ?? this.startAt,
    endAt: endAt ?? this.endAt,
  );
  CycleRecord copyWithCompanion(CycleRecordsCompanion data) {
    return CycleRecord(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      startAt: data.startAt.present ? data.startAt.value : this.startAt,
      endAt: data.endAt.present ? data.endAt.value : this.endAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CycleRecord(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('startAt: $startAt, ')
          ..write('endAt: $endAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt, startAt, endAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CycleRecord &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.startAt == this.startAt &&
          other.endAt == this.endAt);
}

class CycleRecordsCompanion extends UpdateCompanion<CycleRecord> {
  final Value<int> id;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> startAt;
  final Value<int> endAt;
  const CycleRecordsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.startAt = const Value.absent(),
    this.endAt = const Value.absent(),
  });
  CycleRecordsCompanion.insert({
    this.id = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    required int startAt,
    required int endAt,
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       startAt = Value(startAt),
       endAt = Value(endAt);
  static Insertable<CycleRecord> custom({
    Expression<int>? id,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? startAt,
    Expression<int>? endAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (startAt != null) 'start_at': startAt,
      if (endAt != null) 'end_at': endAt,
    });
  }

  CycleRecordsCompanion copyWith({
    Value<int>? id,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? startAt,
    Value<int>? endAt,
  }) {
    return CycleRecordsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (startAt.present) {
      map['start_at'] = Variable<int>(startAt.value);
    }
    if (endAt.present) {
      map['end_at'] = Variable<int>(endAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CycleRecordsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('startAt: $startAt, ')
          ..write('endAt: $endAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$_CycleLocalDataStoreDatabase extends GeneratedDatabase {
  _$_CycleLocalDataStoreDatabase(QueryExecutor e) : super(e);
  $_CycleLocalDataStoreDatabaseManager get managers =>
      $_CycleLocalDataStoreDatabaseManager(this);
  late final $CycleRecordsTable cycleRecords = $CycleRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cycleRecords];
}

typedef $$CycleRecordsTableCreateCompanionBuilder =
    CycleRecordsCompanion Function({
      Value<int> id,
      required int createdAt,
      required int updatedAt,
      required int startAt,
      required int endAt,
    });
typedef $$CycleRecordsTableUpdateCompanionBuilder =
    CycleRecordsCompanion Function({
      Value<int> id,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> startAt,
      Value<int> endAt,
    });

class $$CycleRecordsTableFilterComposer
    extends Composer<_$_CycleLocalDataStoreDatabase, $CycleRecordsTable> {
  $$CycleRecordsTableFilterComposer({
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

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endAt => $composableBuilder(
    column: $table.endAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CycleRecordsTableOrderingComposer
    extends Composer<_$_CycleLocalDataStoreDatabase, $CycleRecordsTable> {
  $$CycleRecordsTableOrderingComposer({
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

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endAt => $composableBuilder(
    column: $table.endAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CycleRecordsTableAnnotationComposer
    extends Composer<_$_CycleLocalDataStoreDatabase, $CycleRecordsTable> {
  $$CycleRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get startAt =>
      $composableBuilder(column: $table.startAt, builder: (column) => column);

  GeneratedColumn<int> get endAt =>
      $composableBuilder(column: $table.endAt, builder: (column) => column);
}

class $$CycleRecordsTableTableManager
    extends
        RootTableManager<
          _$_CycleLocalDataStoreDatabase,
          $CycleRecordsTable,
          CycleRecord,
          $$CycleRecordsTableFilterComposer,
          $$CycleRecordsTableOrderingComposer,
          $$CycleRecordsTableAnnotationComposer,
          $$CycleRecordsTableCreateCompanionBuilder,
          $$CycleRecordsTableUpdateCompanionBuilder,
          (
            CycleRecord,
            BaseReferences<
              _$_CycleLocalDataStoreDatabase,
              $CycleRecordsTable,
              CycleRecord
            >,
          ),
          CycleRecord,
          PrefetchHooks Function()
        > {
  $$CycleRecordsTableTableManager(
    _$_CycleLocalDataStoreDatabase db,
    $CycleRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CycleRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CycleRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CycleRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> startAt = const Value.absent(),
                Value<int> endAt = const Value.absent(),
              }) => CycleRecordsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                startAt: startAt,
                endAt: endAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                required int startAt,
                required int endAt,
              }) => CycleRecordsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                startAt: startAt,
                endAt: endAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CycleRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$_CycleLocalDataStoreDatabase,
      $CycleRecordsTable,
      CycleRecord,
      $$CycleRecordsTableFilterComposer,
      $$CycleRecordsTableOrderingComposer,
      $$CycleRecordsTableAnnotationComposer,
      $$CycleRecordsTableCreateCompanionBuilder,
      $$CycleRecordsTableUpdateCompanionBuilder,
      (
        CycleRecord,
        BaseReferences<
          _$_CycleLocalDataStoreDatabase,
          $CycleRecordsTable,
          CycleRecord
        >,
      ),
      CycleRecord,
      PrefetchHooks Function()
    >;

class $_CycleLocalDataStoreDatabaseManager {
  final _$_CycleLocalDataStoreDatabase _db;
  $_CycleLocalDataStoreDatabaseManager(this._db);
  $$CycleRecordsTableTableManager get cycleRecords =>
      $$CycleRecordsTableTableManager(_db, _db.cycleRecords);
}
