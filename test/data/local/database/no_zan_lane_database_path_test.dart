import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:no_zan_lane/data/local/database/no_zan_lane_database_path.dart';
import 'package:path/path.dart' as p;

void main() {
  group('ensureNoZanLaneDatabaseFile', () {
    test('NO_ZANLANE_DB_PATH が最優先でディレクトリを作成する', () async {
      final tmp = await Directory.systemTemp.createTemp('nozanlane_db_path_');
      addTearDown(() async => tmp.delete(recursive: true));

      final dbFile = File(p.join(tmp.path, 'nested', 'custom.sqlite'));
      final resolved = await ensureNoZanLaneDatabaseFile(
        environment: {
          kNoZanLaneDbPathEnv: dbFile.path,
          kNoZanLaneDataDirEnv: p.join(tmp.path, 'ignored'),
          if (Platform.environment['HOME'] case final String home) 'HOME': home,
          if (Platform.environment['USERPROFILE'] case final String userProfile)
            'USERPROFILE': userProfile,
        },
      );

      expect(resolved.path, dbFile.path);
      expect(dbFile.parent.existsSync(), isTrue);
    });

    test('NO_ZANLANE_DATA_DIR の直下に database.sqlite を置く', () async {
      final tmp = await Directory.systemTemp.createTemp('nozanlane_data_dir_');
      addTearDown(() async => tmp.delete(recursive: true));

      final resolved = await ensureNoZanLaneDatabaseFile(
        environment: {
          kNoZanLaneDataDirEnv: tmp.path,
          if (Platform.environment['HOME'] case final String home) 'HOME': home,
          if (Platform.environment['USERPROFILE'] case final String userProfile)
            'USERPROFILE': userProfile,
        },
      );

      expect(
        resolved.path,
        p.join(tmp.path, kNoZanLaneDatabaseFileName),
      );
      expect(tmp.existsSync(), isTrue);
    });

    test('環境変数が無いとき HOME 直下の .NoZanLane/database.sqlite', () async {
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
