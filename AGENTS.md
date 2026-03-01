# Repository Guidelines

## パッケージ

- 新たに追加するときは、安定版の最新バージョンを追加してください。

## プロジェクト構成とモジュール配置

### View 層

#### Frame

- 各画面の実装は `frame/画面名/` フォルダ以下に置きます。
- 詳細は impl-frame スキルを参考にしてください。

### 共通コンポーネント層

- 共通コンポーネントは `component/` フォルダ以下に置きます。
- 詳細は impl-component スキルを参考にしてください。

## ビルド・テスト・開発コマンド

- コード生成:
  - `fvm flutter gen-l10n`
  - `fvm flutter pub run build_runner build --delete-conflicting-outputs`
- 解析・テスト:
  - `fvm dart format lib test`
  - `fvm flutter analyze`
  - `fvm flutter test`
- CI は PR ごとに `format` と `analyze` を実行。

## コーディング規約と命名

- Lint は `very_good_analysis` に準拠（`analysis_options.yaml`）。
- 状態管理は `hooks_riverpod` + `flutter_hooks` を使用。
- 画面遷移は `go_router` を使用。
- モデルは `freezed` で定義し、`build_runner` で生成する。
- 文字列はハードコードせず、ARB（`lib/l10n/*.arb`）経由で管理する。
- テーマは Material 3 のダークテーマ固定（`ThemeMode.dark`）。
- コメントとコミットメッセージは日本語でお願いします。

## 仕様書を残す

- 「仕様書を残す」という指示がある場合は、対象 dart ファイルと同じフォルダに `ファイル名.md` というファイル名でマークダウンファイルとして仕様書を保存する。

## テスト方針
