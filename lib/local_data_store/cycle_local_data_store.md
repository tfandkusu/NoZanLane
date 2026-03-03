# CycleLocalDataStore 仕様書

## 目的

サイクル情報を SQLite に保存するローカルデータストア。

## テーブル

- テーブル名: `cycles`
- カラム:
  - `id` (INTEGER, PRIMARY KEY AUTOINCREMENT)
  - `created_at` (TEXT, NOT NULL)
  - `updated_at` (TEXT, NOT NULL)
  - `start_at` (TEXT, NOT NULL)
  - `end_at` (TEXT, NOT NULL)

日時は `DateTime.toIso8601String()` の文字列形式で保存する。

## 初期データ

テーブルが空の場合のみ、実行日時を基準に 3 件を投入する。

- 先週
- 今週
- 来週

週の定義は以下。

- 開始: 月曜日 00:00
- 終了: 日曜日 24:00（実装上は翌月曜日 00:00 を `end_at` に保存）

## API

- `add({required DateTime startAt, required DateTime endAt})`
  - サイクルを 1 件追加する。
  - 戻り値は挿入された `id`。
- `list()`
  - `start_at` 昇順で全件取得する。
- `close()`
  - DB 接続をクローズする。

## テスト観点

- 初期データ 3 件が取得できること。
- 4 件目を追加後、一覧取得で 4 件になること。
