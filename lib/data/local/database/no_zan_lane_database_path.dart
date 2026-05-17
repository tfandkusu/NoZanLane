import 'dart:io';

import 'package:path/path.dart' as p;

/// データを置く既定ディレクトリ名（ユーザーのホーム直下）。
const String kNoZanLaneDataDirName = '.NoZanLane';

/// 既定の SQLite ファイル名。
const String kNoZanLaneDatabaseFileName = 'database.sqlite';

/// デスクトップ／CLI 向けに、`~/.NoZanLane/database.sqlite` 相当のファイルを返す。
///
/// [environment] は省略時 [Platform.environment]。テストでホームだけ差し替える場合に渡す。
Future<File> ensureNoZanLaneDatabaseFile({
  Map<String, String>? environment,
}) async {
  final env = environment ?? Platform.environment;

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
