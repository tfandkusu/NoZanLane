import 'package:drift/drift.dart';
import 'package:no_zan_lane/data/local/database/no_zan_lane_database.dart';
import 'package:no_zan_lane/data/local/service/local_current_time.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cycle_local_data_source.g.dart';

/// サイクルを SQLite に保存するローカルデータソース。
class CycleLocalDataSource {
  /// コンストラクタ。
  CycleLocalDataSource({
    required NoZanLaneDatabase database,
    required LocalCurrentTime currentTime,
  }) : _database = database,
       _currentTime = currentTime;

  final NoZanLaneDatabase _database;
  final LocalCurrentTime _currentTime;

  /// サイクルを1件追加し、挿入されたIDを返す。
  Future<int> add({
    required DateTime startAt,
    required DateTime endAt,
  }) {
    final now = _currentTime.now().millisecondsSinceEpoch;
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

/// CycleLocalDataSource の生成を担当する Provider。
@riverpod
Future<CycleLocalDataSource> cycleLocalDataSource(Ref ref) async {
  final database = await ref.watch(noZanLaneDatabaseProvider.future);
  final currentTime = ref.watch(localCurrentTimeProvider);

  return CycleLocalDataSource(database: database, currentTime: currentTime);
}
