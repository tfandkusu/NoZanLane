# NoZanLane

Offline Mac desktop task planner with relative point estimates and velocity tracking.

## 開発プロセス

このリポジトリは Codex を使ったバイブコーディングで開発を進めています。

```mermaid
stateDiagram-v2
  [*] --> Issue作成
  Issue作成 --> Figma作成
  Figma作成 --> 参照判定

  state 参照判定 <<choice>>
  参照判定 --> Figma参照あり: IssueにFigmaリンクあり
  参照判定 --> Figma参照なし: IssueにFigmaリンクなし

  Figma参照あり --> Codex実装
  Figma参照なし --> Codex実装

  Codex実装 --> PRレビュー
  PRレビュー --> マージ完了
  マージ完了 --> [*]
```
