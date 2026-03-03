import 'package:drift/drift.dart';

part 'cycle_local_data_store.g.dart';

/// サイクルを保存するテーブル定義。
@DataClassName('Cycle')
class CycleRecords extends Table {
  /// テーブル名。
  @override
  String get tableName => 'cycles';

  /// プライマリーID。
  IntColumn get id => integer().autoIncrement()();

  /// 作成日時（UNIX ミリ秒）。
  IntColumn get createdAt => integer()();

  /// 更新日時（UNIX ミリ秒）。
  IntColumn get updatedAt => integer()();

  /// サイクル開始日時（UNIX ミリ秒）。
  IntColumn get startAt => integer()();

  /// サイクル終了日時（UNIX ミリ秒）。
  IntColumn get endAt => integer()();
}

@DriftDatabase(tables: [CycleRecords])
class _CycleLocalDataStoreDatabase extends _$_CycleLocalDataStoreDatabase {
  _CycleLocalDataStoreDatabase({
    required QueryExecutor executor,
  }) : super(executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
  );
}

/// サイクルを SQLite に保存するローカルデータストア。
class CycleLocalDataStore {
  CycleLocalDataStore._({
    required _CycleLocalDataStoreDatabase database,
    required DateTime Function() now,
  }) : _database = database,
       _now = now;

  final _CycleLocalDataStoreDatabase _database;
  final DateTime Function() _now;

  /// データストアを生成して初期化する。
  static Future<CycleLocalDataStore> create({
    required QueryExecutor executor,
    DateTime Function()? now,
  }) async {
    final nowProvider = now ?? DateTime.now;
    final database = _CycleLocalDataStoreDatabase(
      executor: executor,
    );

    // DB をオープンしてマイグレーションを実行する。
    await database.customSelect('SELECT 1').getSingle();

    return CycleLocalDataStore._(database: database, now: nowProvider);
  }

  /// サイクルを1件追加し、挿入されたIDを返す。
  Future<int> add({
    required DateTime startAt,
    required DateTime endAt,
  }) {
    final now = _now().millisecondsSinceEpoch;
    return _database
        .into(_database.cycleRecords)
        .insert(
          CycleRecordsCompanion.insert(
            createdAt: now,
            updatedAt: now,
            startAt: startAt.millisecondsSinceEpoch,
            endAt: endAt.millisecondsSinceEpoch,
          ),
        );
  }

  /// サイクルを開始日時の昇順で全件返す。
  Future<List<Cycle>> list() async {
    final records = await (_database.select(
      _database.cycleRecords,
    )..orderBy([(table) => OrderingTerm.asc(table.startAt)])).get();

    return records.toList(growable: false);
  }

  /// DB 接続をクローズする。
  Future<void> close() => _database.close();
}
