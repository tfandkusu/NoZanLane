# CycleLocalDataStore 仕様書

## 目的

サイクル情報を SQLite に保存するローカルデータストア。

## テーブル

- テーブル名: `cycles`
- 定義方法: `lib/data/local/record/cycle.dart` の `Cycle extends Table`
- 外部利用する型: Drift が生成する `CycleData`
- カラム:
  - `id` (INTEGER, PRIMARY KEY AUTOINCREMENT)
  - `created_at` (INTEGER, NOT NULL)
  - `updated_at` (INTEGER, NOT NULL)
  - `start_at` (INTEGER, NOT NULL)
  - `end_at` (INTEGER, NOT NULL)

日時は `DateTime.millisecondsSinceEpoch`（UNIX ミリ秒）で保存する。

## マイグレーション

- Drift の `MigrationStrategy` を使用する。
- `onCreate` で `m.createAll()` を実行してテーブル作成する。
- `onCreate` では初期データ投入を行わない。

## Seed

- 初期データ投入は `LocalDataStoreSeed` が担当する。
- 呼び出し元はテストコードのみとする。
- `seedInitialData` で先週・今週・来週の 3 件を投入する。

## Provider

- `cycleLocalDataStoreProvider` がデータストア生成と初期化を担当する。
- `CycleLocalDataStore` の取得は Riverpod Provider 経由で行う。

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

## テスト観点

- 初期データ 3 件が取得できること。
- 4 件目を追加後、一覧取得で 4 件になること。
