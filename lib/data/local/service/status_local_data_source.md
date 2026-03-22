# StatusLocalDataSource 仕様書

## 目的

タスクのステータス（TODO / Progress など）を SQLite に保存するローカルデータソース。

## テーブル

- テーブル名: `statuses`
- 定義方法: `lib/data/local/entity/status.dart` の `Status extends Table`
- 外部利用する型: Drift が生成する `StatusData`
- カラム:
  - `id` (INTEGER, PRIMARY KEY) ※ AUTOINCREMENT ではなく、投入時に明示する
  - `label` (TEXT, NOT NULL)
  - `color` (INTEGER, NOT NULL) — 表示色（0xRRGGBB）

## マイグレーション

- Drift の `MigrationStrategy` を使用する。
- `onCreate` で `m.createAll()` を実行してテーブル作成する。
- `onCreate` では初期データ投入を行わない。

## Seed

- 初期データ投入は `lib/data/local/seed/local_data_seed.dart` の
  `LocalDataSeed` が担当する。
- 呼び出し元はテストコードのみとする（現状）。
- 情報源は `assets/seed.yaml` の `statuses` セクション。
- `seedInitialData` 内で、ステータステーブルが空のときのみ `replaceAll` で一括投入する。

## Provider

- `lib/data/local/database/no_zan_lane_database.dart` の
  `noZanLaneDatabaseProvider` から `NoZanLaneDatabase` を取得する。
  実行時には `noZanLaneDatabaseProvider` の override が必要な場合がある。
- `lib/data/local/service/status_local_data_source.dart` の
  `statusLocalDataSourceProvider` が `StatusLocalDataSource` を提供する。
- `StatusLocalDataSource` の取得は Riverpod Provider 経由で行う。

## API

- `replaceAll(List<StatusCompanion> companions)`
  - トランザクション内でテーブルを全削除し、`companions` を一括挿入する。
- `list()`
  - `id` 昇順で全件取得する。

## テスト観点

- 挿入順に依存せず、`list()` が ID 昇順で返ること。
- `replaceAll` 後、指定した件数・内容が取得できること。
