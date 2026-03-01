# DSProfileMainPhoto 仕様書

## 概要

- プロフィール写真を表示する共通コンポーネント。
- Figma 指定（横幅 320）に合わせ、親要素の横幅を埋める。
- 表示領域の縦横比は常に 1:1 を維持する。

## クラス

- クラス名: `DSProfileMainPhoto`
- 継承: `StatelessWidget`
- ファイル: `lib/component/ds_profile_main_photo.dart`

## コンストラクタ引数

- `imageUrl` (`String`, 必須):
  インターネット上の画像 URL。

## 表示仕様

- 背景: 透明
- 横幅: `double.infinity`（親要素の横幅いっぱい）
- 縦横比: `AspectRatio(aspectRatio: 1)` で正方形固定
- 画像表示: `Image.network` + `BoxFit.cover`
- 画像取得失敗時: `SizedBox.expand()` を表示

## Widgetbook UseCase

- ファイル: `lib/widgetbook/component/ds_profile_main_photo_use_case.dart`
- 指定 URL を `imageUrl` に渡して表示確認を行う。
