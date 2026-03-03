import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:no_zan_lane/seed/seed_issue_loader.dart';

class _TestAssetBundle extends CachingAssetBundle {
  _TestAssetBundle(this._assetMap);

  final Map<String, String> _assetMap;

  @override
  Future<ByteData> load(String key) async {
    final value = _assetMap[key];
    if (value == null) {
      throw StateError('Missing test asset: $key');
    }

    final bytes = Uint8List.fromList(utf8.encode(value));
    return ByteData.sublistView(bytes);
  }

  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    final value = _assetMap[key];
    if (value == null) {
      throw StateError('Missing test asset: $key');
    }
    return value;
  }
}

void main() {
  test('YAML から Issue シード一覧を読み込める', () async {
    const yaml = '''
issues:
  - title: テスト Issue
    body: テスト本文
    relative_point: 5
    cycle:
      start_at: 2026-03-01T09:00:00+09:00
      end_at: 2026-03-08T18:00:00+09:00
    status: todo
''';

    final loader = SeedIssueLoader(
      assetBundle: _TestAssetBundle({'assets/seeds/issues.yaml': yaml}),
    );

    final issues = await loader.load();

    expect(issues, hasLength(1));
    expect(issues.first.title, 'テスト Issue');
    expect(issues.first.body, 'テスト本文');
    expect(issues.first.relativePoint, 5);
    expect(issues.first.status, 'todo');
    expect(
      issues.first.cycleStartAt,
      DateTime.parse('2026-03-01T09:00:00+09:00'),
    );
    expect(
      issues.first.cycleEndAt,
      DateTime.parse('2026-03-08T18:00:00+09:00'),
    );
  });
}
