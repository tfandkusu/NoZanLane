import 'package:drift/drift.dart';
import 'package:no_zan_lane/data/entity/cycle.dart';

part 'cycle_local_data_store.g.dart';

/// サイクルを保存するテーブル定義。
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
    required DateTime Function() now,
  }) : _now = now,
       super(executor);

  final DateTime Function() _now;

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await _insertInitialCycles();
    },
  );

  Future<void> _insertInitialCycles() async {
    final monday = _startOfWeek(_now());
    final starts = [
      monday.subtract(const Duration(days: 7)),
      monday,
      monday.add(const Duration(days: 7)),
    ];

    final now = _now().millisecondsSinceEpoch;
    await batch((batch) {
      for (final start in starts) {
        final end = start.add(const Duration(days: 7));
        batch.insert(
          cycleRecords,
          CycleRecordsCompanion.insert(
            createdAt: now,
            updatedAt: now,
            startAt: start.millisecondsSinceEpoch,
            endAt: end.millisecondsSinceEpoch,
          ),
        );
      }
    });
  }

  DateTime _startOfWeek(DateTime dateTime) {
    final midnight = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final daysFromMonday = midnight.weekday - DateTime.monday;
    return midnight.subtract(Duration(days: daysFromMonday));
  }
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
      now: nowProvider,
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

    return records
        .map(
          (record) => Cycle(
            id: record.id,
            createdAt: DateTime.fromMillisecondsSinceEpoch(record.createdAt),
            updatedAt: DateTime.fromMillisecondsSinceEpoch(record.updatedAt),
            startAt: DateTime.fromMillisecondsSinceEpoch(record.startAt),
            endAt: DateTime.fromMillisecondsSinceEpoch(record.endAt),
          ),
        )
        .toList(growable: false);
  }

  /// DB 接続をクローズする。
  Future<void> close() => _database.close();
}
