---
name: impl-component
description: 共通コンポーネントを実装するスキルです。
---

# 共通コンポーネントとは

- 複数の画面で使いまわし可能な Widget

# フォルダ

- component/ フォルダ

# コンポーネント名

- 先頭に DS を付ける

# クラス名

- コンポーネント名と同じにする

# 継承

- StatelessWidget を継承する

# 引数

- 状態およびコールバックを引数として持つ

# レイアウト規約

- Figma 上で横幅が 320 固定となっているコンポーネントは、実装時に親要素の横幅をいっぱいに使うようにしてください。

# Widgetbook 登録

- 共通コンポーネントを追加したら Widgetbook にも登録する
- UseCase メソッドの命名は「コンポーネント名のキャメルケース + UseCase」とする

# Figma URL がある場合

- Figma URL が指定されていたら Figma MCP を使い、指定の Component を実装する
- コンポーネント名は Figma のコンポーネント名と同じにする
