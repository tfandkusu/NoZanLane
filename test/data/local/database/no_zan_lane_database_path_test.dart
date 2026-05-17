import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:no_zan_lane/data/local/database/no_zan_lane_database_path.dart';
import 'package:path/path.dart' as p;

void main() {
  group('ensureNoZanLaneDatabaseFile', () {
    test('HOME 直下の .NoZanLane/database.sqlite を作成する', () async {
      final tmp = await Directory.systemTemp.createTemp('nozanlane_home_');
      addTearDown(() async => tmp.delete(recursive: true));

      final resolved = await ensureNoZanLaneDatabaseFile(
        environment: {
          'HOME': tmp.path,
          if (Platform.isWindows) 'USERPROFILE': tmp.path,
        },
      );

      expect(
        resolved.path,
        p.join(tmp.path, kNoZanLaneDataDirName, kNoZanLaneDatabaseFileName),
      );
      expect(
        Directory(p.join(tmp.path, kNoZanLaneDataDirName)).existsSync(),
        isTrue,
      );
    });

    test('HOME が無くてパスを決められないときは StateError', () async {
      await expectLater(
        ensureNoZanLaneDatabaseFile(environment: {}),
        throwsA(isA<StateError>()),
      );
    });
  });

  group('resolveUserHomeDirectory', () {
    test('Windows では USERPROFILE を優先する', () {
      expect(
        resolveUserHomeDirectory({
          'USERPROFILE': r'C:\Users\Test',
          'HOME': '/fallback',
        }),
        r'C:\Users\Test',
      );
    }, skip: !Platform.isWindows);

    test('Windows で USERPROFILE が無いとき HOME', () {
      expect(
        resolveUserHomeDirectory({'HOME': r'D:\home'}),
        r'D:\home',
      );
    }, skip: !Platform.isWindows);

    test('Unix では HOME を使う', () {
      expect(
        resolveUserHomeDirectory({'HOME': '/Users/x'}),
        '/Users/x',
      );
    }, skip: Platform.isWindows);
  });
}
