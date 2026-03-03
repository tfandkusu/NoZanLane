import 'package:flutter/services.dart';
import 'package:no_zan_lane/seed/seed_issue.dart';
import 'package:yaml/yaml.dart';

/// YAML から Issue シードデータを読み込むローダーです。
class SeedIssueLoader {
  /// [SeedIssueLoader] を生成します。
  const SeedIssueLoader({
    required AssetBundle assetBundle,
    this.assetPath = 'assets/seeds/issues.yaml',
  }) : _assetBundle = assetBundle;

  final AssetBundle _assetBundle;

  /// 読み込み対象のシード YAML アセットパスです。
  final String assetPath;

  /// アセット YAML から Issue 一覧を読み込みます。
  Future<List<SeedIssue>> load() async {
    final yamlString = await _assetBundle.loadString(assetPath);
    final document = loadYaml(yamlString) as YamlMap;
    final cycleNodes = (document['cycles'] as YamlList?) ?? YamlList();
    final statusNodes = (document['statuses'] as YamlList?) ?? YamlList();
    final issueNodes = (document['issues'] as YamlList?) ?? YamlList();

    final cycleMap = <String, YamlMap>{
      for (final node in cycleNodes) (node as YamlMap)['id'] as String: node,
    };
    final statusMap = <String, YamlMap>{
      for (final node in statusNodes) (node as YamlMap)['id'] as String: node,
    };

    return issueNodes
        .map((node) {
          final map = node as YamlMap;
          final cycleId = map['cycle_id'] as String;
          final statusId = map['status_id'] as String;
          final cycle = cycleMap[cycleId];
          final status = statusMap[statusId];

          if (cycle == null) {
            throw StateError('Unknown cycle_id: $cycleId');
          }
          if (status == null) {
            throw StateError('Unknown status_id: $statusId');
          }

          return SeedIssue(
            id: map['id'] as String,
            title: map['title'] as String,
            body: map['body'] as String,
            relativePoint: map['relative_point'] as int,
            cycleStartAt: DateTime.parse(cycle['start_at'] as String),
            cycleEndAt: DateTime.parse(cycle['end_at'] as String),
            status: statusId,
            statusLabel: status['label'] as String,
          );
        })
        .toList(growable: false);
  }
}
