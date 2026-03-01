---
name: impl-frame
description: 画面を実装するときに使います。
---

# フォルダ構成

- 画面に必要なクラス群はすべて `frame/画面名/` フォルダに置きます。

# Frame クラス

- クラス名は `画面名Frame` にしてください。
- HookConsumerWidget を継承してください。

# 画面の状態

- 画面の状態は、`画面名UiModel` クラスで定義してください。
- `画面名UiModel` クラスは freezed で定義し、build_runner で生成してください。

# Riverpod の使い方はまだ未定義

# Widgetbook 登録

- Frame を追加したら Widgetbook にも登録する
- UseCase メソッドの命名は「画面名のキャメルケース + UseCase」とする

## 画面状態

- 画面状態は Riverpod の override を使うことで、Widgetbook 用に固定の画面状態を提供してください。

# Figma URL がある場合

- Figma URL が指定されていたら Figma MCP を使い、指定の Frame を実装する
- 画面クラス名は Figma の Frame 名と同じにする

## Edge-to-edge 対応

- Figma 上のステータスバーとナビゲーションバーの重なりを考慮して実装してください。
