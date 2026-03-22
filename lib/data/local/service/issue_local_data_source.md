# IssueLocalDataSource 仕様書

## 目的

仕事のタスク（Issue）情報を SQLite に保存するローカルデータソース。

## テーブル

- テーブル名: `issues`
- 定義方法: `lib/data/local/entity/issue.dart` の `Issue extends Table`
- 外部利用する型: Drift が生成する `IssueData`
- カラム:
  - `id` (INTEGER, PRIMARY KEY AUTOINCREMENT)
  - `title` (TEXT, NOT NULL)
  - `body` (TEXT, NOT NULL)
  - `point` (INTEGER, NOT NULL) - 相対ポイント
  - `cycle_id` (INTEGER, NOT NULL) - cycles テーブルへの外部キー
  - `status_id` (INTEGER, NOT NULL) - statuses テーブルへの外部キー

## 結合

- サイクルは Cycle クラスのテーブルを参照する
- ステータスは Status クラスのテーブルを参照する
- ステータスは seed.yaml から読み取る

## マイグレーション

- Drift の `MigrationStrategy` を使用する。
- `onCreate` で `m.createAll()` を実行してテーブル作成する。
- `onUpgrade` で schemaVersion 3 から 4 への昇格時に issues テーブルを作成する。

## Seed

- 初期データ投入は `lib/data/local/seed/local_data_seed.dart` の
  `LocalDataSeed` が担当する。
- seed.yaml の `issues` セクションから読み取る。

## Provider

- `lib/data/local/database/no_zan_lane_database.dart` の
  `noZanLaneDatabaseProvider` から `NoZanLaneDatabase` を取得する。
- `lib/data/local/service/issue_local_data_source.dart` の
  `issueLocalDataSourceProvider` が `IssueLocalDataSource` を提供する。

## API

- `replaceAll(List<IssueCompanion> companions)`
  - Issue を全件置き換える。
- `list()`
  - `id` 昇順で全件取得する。
