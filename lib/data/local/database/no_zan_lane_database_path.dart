import 'dart:io';

import 'package:path/path.dart' as p;

/// データを置く既定ディレクトリ名（ユーザーのホーム直下）。
const String kNoZanLaneDataDirName = '.NoZanLane';

/// 既定の SQLite ファイル名。
const String kNoZanLaneDatabaseFileName = 'database.sqlite';

/// データディレクトリを上書きする環境変数名（直下に [kNoZanLaneDatabaseFileName]）。
const String kNoZanLaneDataDirEnv = 'NO_ZANLANE_DATA_DIR';

/// DB ファイルパスを完全指定する環境変数名。
const String kNoZanLaneDbPathEnv = 'NO_ZANLANE_DB_PATH';

/// デスクトップ／CLI 向けに、`~/.NoZanLane/database.sqlite` 相当のファイルを返す。
///
/// [environment] を省略すると [Platform.environment] を使う。テストでは Map を渡して差し替える。
/// [kNoZanLaneDbPathEnv] が最優先、[kNoZanLaneDataDirEnv] が次、どちらも無ければホーム直下の既定パス。
Future<File> ensureNoZanLaneDatabaseFile({
  Map<String, String>? environment,
}) async {
  final env = environment ?? Platform.environment;

  final dbPathOverride = _nonEmpty(env[kNoZanLaneDbPathEnv]);
  if (dbPathOverride != null) {
    final file = File(dbPathOverride);
    await file.parent.create(recursive: true);
    return file;
  }

  final dataDirOverride = _nonEmpty(env[kNoZanLaneDataDirEnv]);
  if (dataDirOverride != null) {
    final dir = Directory(dataDirOverride);
    await dir.create(recursive: true);
    return File(p.join(dir.path, kNoZanLaneDatabaseFileName));
  }

  final home = resolveUserHomeDirectory(env);
  if (home == null) {
    throw StateError(
      'ユーザーのホームディレクトリを決定できません。'
      'HOME（Unix）または USERPROFILE / HOME（Windows）を設定してください。',
    );
  }

  final dataDir = Directory(p.join(home, kNoZanLaneDataDirName));
  await dataDir.create(recursive: true);
  return File(p.join(dataDir.path, kNoZanLaneDatabaseFileName));
}

/// ユーザーのホームディレクトリのパス。Windows は USERPROFILE を優先し、無ければ HOME。
String? resolveUserHomeDirectory(Map<String, String> environment) {
  if (Platform.isWindows) {
    return _nonEmpty(environment['USERPROFILE']) ??
        _nonEmpty(environment['HOME']);
  }
  return _nonEmpty(environment['HOME']);
}

String? _nonEmpty(String? value) {
  if (value == null) {
    return null;
  }
  final trimmed = value.trim();
  return trimmed.isEmpty ? null : trimmed;
}
