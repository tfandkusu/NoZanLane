import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:no_zan_lane/data/local/database/no_zan_lane_database.dart';
import 'package:no_zan_lane/data/local/service/cycle_local_data_source.dart';
import 'package:no_zan_lane/data/local/service/issue_local_data_source.dart';
import 'package:no_zan_lane/data/local/service/local_current_time.dart';
import 'package:no_zan_lane/data/local/service/status_local_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaml/yaml.dart';

part 'local_data_seed.g.dart';

/// ローカルデータ初期投入を担当するクラス。
class LocalDataSeed {
  /// コンストラクタ。
  ///
  /// 現在時刻は [LocalCurrentTime] から注入し、
  /// テスト時に固定時刻へ差し替えられるようにしている。
  const LocalDataSeed({required LocalCurrentTime currentTime})
    : _currentTime = currentTime;

  /// 初期サイクル生成の基準時刻を提供する依存。
  final LocalCurrentTime _currentTime;

  /// 初期データを投入する。
  Future<void> seedInitialData({
    required CycleLocalDataSource cycleLocalDataSource,
    required StatusLocalDataSource statusLocalDataSource,
    required IssueLocalDataSource issueLocalDataSource,
    String? yamlText,
  }) async {
    await _seedCycles(cycleLocalDataSource);
    await _seedStatuses(statusLocalDataSource, yamlText: yamlText);
    await _seedIssues(issueLocalDataSource, yamlText: yamlText);
  }

  /// サイクルの初期データを投入する。
  Future<void> _seedCycles(CycleLocalDataSource cycleLocalDataSource) async {
    final existing = await cycleLocalDataSource.list();
    if (existing.isNotEmpty) {
      return;
    }

    final monday = _startOfWeek(_currentTime.now());
    final starts = [
      monday.subtract(const Duration(days: 7)),
      monday,
      monday.add(const Duration(days: 7)),
    ];

    for (final start in starts) {
      final end = start.add(const Duration(days: 7));
      await cycleLocalDataSource.add(startAt: start, endAt: end);
    }
  }

  /// seed.yaml の statuses を初期投入する。
  Future<void> _seedStatuses(
    StatusLocalDataSource statusLocalDataSource, {
    String? yamlText,
  }) async {
    final existing = await statusLocalDataSource.list();
    if (existing.isNotEmpty) {
      return;
    }

    final sourceYaml =
        yamlText ?? await rootBundle.loadString('assets/seed.yaml');
    final yaml = loadYaml(sourceYaml) as YamlMap;
    final rawStatuses = yaml['statuses'] as YamlList;

    final companions = rawStatuses
        .map((raw) {
          final entry = raw as YamlMap;
          return StatusCompanion.insert(
            id: Value(entry['id'] as int),
            label: entry['label'] as String,
            color: _toColorValue(entry['color']),
          );
        })
        .toList(growable: false);

    await statusLocalDataSource.replaceAll(companions);
  }

  /// seed.yaml の issues を初期投入する。
  Future<void> _seedIssues(
    IssueLocalDataSource issueLocalDataSource, {
    String? yamlText,
  }) async {
    final existing = await issueLocalDataSource.list();
    if (existing.isNotEmpty) {
      return;
    }

    final sourceYaml =
        yamlText ?? await rootBundle.loadString('assets/seed.yaml');
    final yaml = loadYaml(sourceYaml) as YamlMap;
    final rawIssues = yaml['issues'] as YamlList? ?? YamlList();

    final companions = rawIssues
        .map((raw) {
          final entry = raw as YamlMap;
          return IssueCompanion.insert(
            id: Value(entry['id'] as int),
            title: entry['title'] as String,
            body: (entry['body'] as String).trim(),
            point: entry['point'] as int,
            cycleId: entry['cycle_id'] as int,
            statusId: entry['status_id'] as int,
          );
        })
        .toList(growable: false);

    if (companions.isNotEmpty) {
      await issueLocalDataSource.replaceAll(companions);
    }
  }

  /// color 値を 0xRRGGBB の整数に変換する。
  int _toColorValue(Object? rawColor) {
    if (rawColor is int) {
      return rawColor;
    }
    return int.parse('$rawColor', radix: 16);
  }

  /// 指定日時が含まれる週の月曜 00:00 を返す。
  ///
  /// 週の境界を固定することで、初期投入のサイクル開始日を
  /// 実行時刻に依存せず安定させる。
  DateTime _startOfWeek(DateTime dateTime) {
    final midnight = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final daysFromMonday = midnight.weekday - DateTime.monday;
    return midnight.subtract(Duration(days: daysFromMonday));
  }
}

/// LocalDataSeed を提供する Provider。
@riverpod
LocalDataSeed localDataSeed(Ref ref) {
  final currentTime = ref.watch(localCurrentTimeProvider);
  return LocalDataSeed(currentTime: currentTime);
}
