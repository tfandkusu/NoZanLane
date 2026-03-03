import 'package:drift/drift.dart';
import 'package:no_zan_lane/data/local/record/cycle.dart';

part 'cycle_local_data_store.g.dart';

@DriftDatabase(tables: [Cycle])
/// Cycle 用ローカル DB 定義。
class CycleLocalDataStoreDatabase extends _$CycleLocalDataStoreDatabase {
  /// コンストラクタ。
  CycleLocalDataStoreDatabase({required QueryExecutor executor})
    : super(executor);

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
  /// コンストラクタ。
  CycleLocalDataStore({
    required CycleLocalDataStoreDatabase database,
    required DateTime Function() now,
  }) : _database = database,
       _now = now;

  final CycleLocalDataStoreDatabase _database;
  final DateTime Function() _now;

  /// サイクルを1件追加し、挿入されたIDを返す。
  Future<int> add({
    required DateTime startAt,
    required DateTime endAt,
  }) {
    final now = _now().millisecondsSinceEpoch;
    return _database
        .into(_database.cycle)
        .insert(
          CycleCompanion.insert(
            createdAt: now,
            updatedAt: now,
            startAt: startAt.millisecondsSinceEpoch,
            endAt: endAt.millisecondsSinceEpoch,
          ),
        );
  }

  /// サイクルを開始日時の昇順で全件返す。
  Future<List<CycleData>> list() async {
    final records = await (_database.select(
      _database.cycle,
    )..orderBy([(table) => OrderingTerm.asc(table.startAt)])).get();

    return records.toList(growable: false);
  }
}
