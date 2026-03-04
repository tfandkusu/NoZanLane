import 'package:drift/drift.dart';
import 'package:no_zan_lane/data/local/entity/cycle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'no_zan_lane_database.g.dart';

@DriftDatabase(tables: [Cycle])
/// ローカル DB 定義。
class NoZanLaneDatabase extends _$NoZanLaneDatabase {
  /// コンストラクタ。
  NoZanLaneDatabase({required QueryExecutor executor}) : super(executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
  );
}

/// NoZanLaneDatabase の生成と初期化を担当する Provider。
@riverpod
Future<NoZanLaneDatabase> noZanLaneDatabase(Ref ref) async {
  throw UnimplementedError('noZanLaneDatabaseProvider を override してください。');
}
