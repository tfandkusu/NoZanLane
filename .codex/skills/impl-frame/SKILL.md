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

