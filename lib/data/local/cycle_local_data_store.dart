import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/data/local/record/cycle.dart';

part 'cycle_local_data_store.g.dart';

@DriftDatabase(tables: [Cycle])
class _CycleLocalDataStoreDatabase extends _$_CycleLocalDataStoreDatabase {
  _CycleLocalDataStoreDatabase({required QueryExecutor executor})
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

/// CycleLocalDataStore が利用する QueryExecutor を提供する Provider。
final cycleDatabaseExecutorProvider = Provider<QueryExecutor>((ref) {
  throw UnimplementedError('cycleDatabaseExecutorProvider を override してください。');
});

/// 現在時刻プロバイダ。
final cycleNowProvider = Provider<DateTime Function()>(
  (ref) => DateTime.now,
);

/// CycleLocalDataStore の生成と初期化を担当する Provider。
final cycleLocalDataStoreProvider = FutureProvider<CycleLocalDataStore>((
  ref,
) async {
  final executor = ref.watch(cycleDatabaseExecutorProvider);
  final now = ref.watch(cycleNowProvider);

  final database = _CycleLocalDataStoreDatabase(executor: executor);
  ref.onDispose(database.close);

  // DB をオープンしてマイグレーションを実行する。
  await database.customSelect('SELECT 1').getSingle();

  return CycleLocalDataStore._(database: database, now: now);
});

/// サイクルを SQLite に保存するローカルデータストア。
class CycleLocalDataStore {
  CycleLocalDataStore._({
    required _CycleLocalDataStoreDatabase database,
    required DateTime Function() now,
  }) : _database = database,
       _now = now;

  final _CycleLocalDataStoreDatabase _database;
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
