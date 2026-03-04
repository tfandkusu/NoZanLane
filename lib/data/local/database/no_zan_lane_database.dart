import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:no_zan_lane/data/local/entity/cycle.dart';
import 'package:path_provider/path_provider.dart';
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
  final applicationSupportDirectory = await getApplicationSupportDirectory();
  await applicationSupportDirectory.create(recursive: true);
  final databaseFile = File(
    '${applicationSupportDirectory.path}/no_zan_lane.sqlite',
  );

  final database = NoZanLaneDatabase(
    executor: LazyDatabase(
      () async => NativeDatabase(databaseFile),
    ),
  );

  ref.onDispose(database.close);
  return database;
}
