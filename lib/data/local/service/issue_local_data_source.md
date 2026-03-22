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
  - `sort_order` (INTEGER, NOT NULL) - 同じ (cycle_id, status_id) 内での並び順。1 始まり。ユニークではない

## 結合

- サイクルは Cycle クラスのテーブルを参照する
- ステータスは Status クラスのテーブルを参照する
- ステータスは seed.yaml から読み取る

## Seed

- 初期データ投入は `lib/data/local/seed/local_data_seed.dart` の
  `LocalDataSeed` が担当する。
- seed.yaml の `issues` セクションから読み取る。
- `sort_order` は YAML の記載順を (cycle_id, status_id) ごとの 1 始まりインデックスとして算出する。

## Provider

- `lib/data/local/database/no_zan_lane_database.dart` の
  `noZanLaneDatabaseProvider` から `NoZanLaneDatabase` を取得する。
- `lib/data/local/service/issue_local_data_source.dart` の
  `issueLocalDataSourceProvider` が `IssueLocalDataSource` を提供する。

## API

- `replaceAll(List<IssueCompanion> companions)`
  - Issue を全件置き換える。
- `list(cycleId, statusId)`
  - 指定したサイクル・ステータスに属する Issue を sortOrder 昇順で取得する。
- `listAll()`
  - 全 Issue を cycleId, statusId, sortOrder, id の昇順で取得する。テスト・検証用。
- `hasAny()`
  - Issue が 1 件以上存在するか。
