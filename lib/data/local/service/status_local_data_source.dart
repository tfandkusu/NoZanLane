import 'package:drift/drift.dart';
import 'package:no_zan_lane/data/local/database/no_zan_lane_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaml/yaml.dart';

part 'status_local_data_source.g.dart';

/// ステータスを SQLite に保存するローカルデータソース。
class StatusLocalDataSource {
  /// コンストラクタ。
  StatusLocalDataSource({required NoZanLaneDatabase database})
    : _database = database;

  final NoZanLaneDatabase _database;

  /// seed.yaml の statuses をテーブルに反映する。
  Future<void> writeFromSeedYaml(String yamlText) async {
    final yaml = loadYaml(yamlText);
    if (yaml is! YamlMap) {
      throw const FormatException('seed.yaml の形式が不正です。');
    }

    final rawStatuses = yaml['statuses'];
    if (rawStatuses is! YamlList) {
      throw const FormatException('seed.yaml に statuses がありません。');
    }

    final companions = rawStatuses
        .map((raw) {
          if (raw is! YamlMap) {
            throw const FormatException('statuses の要素形式が不正です。');
          }

          final id = raw['id'];
          final label = raw['label'];
          final color = raw['color'];

          if (id is! int || label is! String || color is! String) {
            throw const FormatException('statuses の id, label, color が不正です。');
          }

          return StatusCompanion.insert(
            id: Value(id),
            label: label,
            color: color,
          );
        })
        .toList(growable: false);

    await _database.transaction(() async {
      await _database.delete(_database.status).go();
      await _database.batch((batch) {
        batch.insertAll(_database.status, companions);
      });
    });
  }

  /// ステータスを ID の昇順で全件返す。
  Future<List<StatusData>> list() async {
    final records = await (_database.select(
      _database.status,
    )..orderBy([(table) => OrderingTerm.asc(table.id)])).get();

    return records.toList(growable: false);
  }
}

/// StatusLocalDataSource の生成を担当する Provider。
@riverpod
Future<StatusLocalDataSource> statusLocalDataSource(Ref ref) async {
  final database = await ref.watch(noZanLaneDatabaseProvider.future);

  return StatusLocalDataSource(database: database);
}
