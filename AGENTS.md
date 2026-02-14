# Repository Guidelines

## プロジェクト構成とモジュール配置

## ビルド・テスト・開発コマンド

- コード生成:
  - `fvm flutter gen-l10n`
  - `fvm flutter pub run build_runner build --delete-conflicting-outputs`
- 解析・テスト:
  - `fvm dart format lib test`
  - `fvm dart analyze`
  - `fvm flutter test`
- CI は PR ごとに `format` と `analyze` を実行。

## コーディング規約と命名

- Lint は `very_good_analysis` に準拠（`analysis_options.yaml`）。
- 状態管理は `hooks_riverpod` + `flutter_hooks` を使用。
- 画面遷移は `go_router` を使用。
- モデルは `freezed` で定義し、`build_runner` で生成する。
- 文字列はハードコードせず、ARB（`lib/l10n/*.arb`）経由で管理する。
- テーマは Material 3 のダークテーマ固定（`ThemeMode.dark`）。

## テスト方針
