// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'no_zan_lane_database.dart';

// ignore_for_file: type=lint
class $CycleTable extends Cycle with TableInfo<$CycleTable, CycleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CycleTable(this.attachedDatabase, [this._alias]);
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
    Insertable<CycleData> instance, {
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
  CycleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CycleData(
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
  $CycleTable createAlias(String alias) {
    return $CycleTable(attachedDatabase, alias);
  }
}

class CycleData extends DataClass implements Insertable<CycleData> {
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
  const CycleData({
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

  CycleCompanion toCompanion(bool nullToAbsent) {
    return CycleCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      startAt: Value(startAt),
      endAt: Value(endAt),
    );
  }

  factory CycleData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CycleData(
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

  CycleData copyWith({
    int? id,
    int? createdAt,
    int? updatedAt,
    int? startAt,
    int? endAt,
  }) => CycleData(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    startAt: startAt ?? this.startAt,
    endAt: endAt ?? this.endAt,
  );
  CycleData copyWithCompanion(CycleCompanion data) {
    return CycleData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      startAt: data.startAt.present ? data.startAt.value : this.startAt,
      endAt: data.endAt.present ? data.endAt.value : this.endAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CycleData(')
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
      (other is CycleData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.startAt == this.startAt &&
          other.endAt == this.endAt);
}

class CycleCompanion extends UpdateCompanion<CycleData> {
  final Value<int> id;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> startAt;
  final Value<int> endAt;
  const CycleCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.startAt = const Value.absent(),
    this.endAt = const Value.absent(),
  });
  CycleCompanion.insert({
    this.id = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    required int startAt,
    required int endAt,
  }) : createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       startAt = Value(startAt),
       endAt = Value(endAt);
  static Insertable<CycleData> custom({
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

  CycleCompanion copyWith({
    Value<int>? id,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? startAt,
    Value<int>? endAt,
  }) {
    return CycleCompanion(
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
    return (StringBuffer('CycleCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('startAt: $startAt, ')
          ..write('endAt: $endAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$NoZanLaneDatabase extends GeneratedDatabase {
  _$NoZanLaneDatabase(QueryExecutor e) : super(e);
  $NoZanLaneDatabaseManager get managers => $NoZanLaneDatabaseManager(this);
  late final $CycleTable cycle = $CycleTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cycle];
}

typedef $$CycleTableCreateCompanionBuilder =
    CycleCompanion Function({
      Value<int> id,
      required int createdAt,
      required int updatedAt,
      required int startAt,
      required int endAt,
    });
typedef $$CycleTableUpdateCompanionBuilder =
    CycleCompanion Function({
      Value<int> id,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> startAt,
      Value<int> endAt,
    });

class $$CycleTableFilterComposer
    extends Composer<_$NoZanLaneDatabase, $CycleTable> {
  $$CycleTableFilterComposer({
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

class $$CycleTableOrderingComposer
    extends Composer<_$NoZanLaneDatabase, $CycleTable> {
  $$CycleTableOrderingComposer({
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

class $$CycleTableAnnotationComposer
    extends Composer<_$NoZanLaneDatabase, $CycleTable> {
  $$CycleTableAnnotationComposer({
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

class $$CycleTableTableManager
    extends
        RootTableManager<
          _$NoZanLaneDatabase,
          $CycleTable,
          CycleData,
          $$CycleTableFilterComposer,
          $$CycleTableOrderingComposer,
          $$CycleTableAnnotationComposer,
          $$CycleTableCreateCompanionBuilder,
          $$CycleTableUpdateCompanionBuilder,
          (
            CycleData,
            BaseReferences<_$NoZanLaneDatabase, $CycleTable, CycleData>,
          ),
          CycleData,
          PrefetchHooks Function()
        > {
  $$CycleTableTableManager(_$NoZanLaneDatabase db, $CycleTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CycleTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CycleTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CycleTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> startAt = const Value.absent(),
                Value<int> endAt = const Value.absent(),
              }) => CycleCompanion(
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
              }) => CycleCompanion.insert(
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

typedef $$CycleTableProcessedTableManager =
    ProcessedTableManager<
      _$NoZanLaneDatabase,
      $CycleTable,
      CycleData,
      $$CycleTableFilterComposer,
      $$CycleTableOrderingComposer,
      $$CycleTableAnnotationComposer,
      $$CycleTableCreateCompanionBuilder,
      $$CycleTableUpdateCompanionBuilder,
      (CycleData, BaseReferences<_$NoZanLaneDatabase, $CycleTable, CycleData>),
      CycleData,
      PrefetchHooks Function()
    >;

class $NoZanLaneDatabaseManager {
  final _$NoZanLaneDatabase _db;
  $NoZanLaneDatabaseManager(this._db);
  $$CycleTableTableManager get cycle =>
      $$CycleTableTableManager(_db, _db.cycle);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// NoZanLaneDatabase の生成と初期化を担当する Provider。

@ProviderFor(noZanLaneDatabase)
final noZanLaneDatabaseProvider = NoZanLaneDatabaseProvider._();

/// NoZanLaneDatabase の生成と初期化を担当する Provider。

final class NoZanLaneDatabaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<NoZanLaneDatabase>,
          NoZanLaneDatabase,
          FutureOr<NoZanLaneDatabase>
        >
    with
        $FutureModifier<NoZanLaneDatabase>,
        $FutureProvider<NoZanLaneDatabase> {
  /// NoZanLaneDatabase の生成と初期化を担当する Provider。
  NoZanLaneDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'noZanLaneDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$noZanLaneDatabaseHash();

  @$internal
  @override
  $FutureProviderElement<NoZanLaneDatabase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<NoZanLaneDatabase> create(Ref ref) {
    return noZanLaneDatabase(ref);
  }
}

String _$noZanLaneDatabaseHash() => r'd95792f613a69687724cca8733fbaaeb1257957b';
