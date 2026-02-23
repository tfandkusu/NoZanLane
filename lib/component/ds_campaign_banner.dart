import 'dart:async';

import 'package:flutter/material.dart';

/// 複数画面で利用可能なキャンペーンバナーです。
class DSCampaignBanner extends StatelessWidget {
  /// [DSCampaignBanner] を生成します。
  const DSCampaignBanner({
    required this.primaryText,
    required this.secondaryText,
    super.key,
    this.backgroundColor = const Color(0xFFFF9800),
  });

  /// 1つ目の文言です。
  final String primaryText;

  /// 2つ目の文言です。
  final String secondaryText;

  /// バナー背景色です。
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: SizedBox(
        height: 48,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _AnimatedBannerTexts(
            primaryText: primaryText,
            secondaryText: secondaryText,
          ),
        ),
      ),
    );
  }
}

class _AnimatedBannerTexts extends StatefulWidget {
  const _AnimatedBannerTexts({
    required this.primaryText,
    required this.secondaryText,
  });

  /// 交互表示する 1 つ目の文言です。
  final String primaryText;

  /// 交互表示する 2 つ目の文言です。
  final String secondaryText;

  @override
  State<_AnimatedBannerTexts> createState() => _AnimatedBannerTextsState();
}

class _AnimatedBannerTextsState extends State<_AnimatedBannerTexts>
    with SingleTickerProviderStateMixin {
  /// 文言を切り替える待機時間です（4秒ごと）。
  static const _switchInterval = Duration(seconds: 4);

  /// 上下スライドのアニメーション時間です（0.2秒）。
  static const _animationDuration = Duration(milliseconds: 200);

  /// スライド量（0.0 -> 1.0）を管理するコントローラーです。
  late final AnimationController _controller;

  /// 一定間隔で切り替え開始を指示するタイマーです。
  Timer? _timer;

  /// 現在表示中の文言インデックスです（0 or 1）。
  int _currentIndex = 0;

  /// 次に表示する文言インデックスです（0 or 1）。
  int _nextIndex = 1;

  /// アニメーション中かどうかのフラグです。
  bool _isAnimating = false;

  /// 表示対象の 2 文言をインデックスで扱いやすくした配列です。
  List<String> get _texts => [widget.primaryText, widget.secondaryText];

  /// 同じ文言同士なら切り替え不要のためアニメーションを無効化します。
  bool get _shouldAnimate => widget.primaryText != widget.secondaryText;

  @override
  /// コントローラー生成とタイマー開始を行います。
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addStatusListener(_handleAnimationStatusChanged);
    _restartTimer();
  }

  @override
  /// 親から文言が更新されたときに内部状態を初期化し直します。
  void didUpdateWidget(covariant _AnimatedBannerTexts oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.primaryText == widget.primaryText &&
        oldWidget.secondaryText == widget.secondaryText) {
      return;
    }

    _timer?.cancel();
    _controller
      ..stop()
      ..reset();
    _currentIndex = 0;
    _nextIndex = 1;
    _isAnimating = false;
    _restartTimer();
  }

  @override
  /// タイマーとコントローラーを破棄してリークを防ぎます。
  void dispose() {
    _timer?.cancel();
    _controller
      ..removeStatusListener(_handleAnimationStatusChanged)
      ..dispose();
    super.dispose();
  }

  /// 切り替え用タイマーを開始します。
  ///
  /// 4秒ごとに「次の文言」を決めて、スライドアニメーションを開始します。
  void _restartTimer() {
    if (!_shouldAnimate) {
      return;
    }

    _timer = Timer.periodic(_switchInterval, (_) {
      if (!mounted || _isAnimating) {
        return;
      }

      setState(() {
        _nextIndex = 1 - _currentIndex;
        _isAnimating = true;
      });
      unawaited(_controller.forward(from: 0));
    });
  }

  /// アニメーション完了時に表示中インデックスを確定します。
  ///
  /// 完了までは `_currentIndex` を更新しないことで、出る文言と入る文言を
  /// 同時に描画できるようにしています。
  void _handleAnimationStatusChanged(AnimationStatus status) {
    if (status != AnimationStatus.completed || !_isAnimating || !mounted) {
      return;
    }

    setState(() {
      _currentIndex = _nextIndex;
      _isAnimating = false;
    });
    _controller.reset();
  }

  @override
  /// 通常時は1つの文言のみ表示し、切り替え中だけ2つ重ねて描画します。
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w500,
    );

    if (!_isAnimating) {
      return _BannerText(
        text: _texts[_currentIndex],
        style: textStyle,
      );
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final progress = _controller.value;

        return ClipRect(
          // バナー外にはみ出したテキストをクリップして見切れを防ぎます。
          child: Stack(
            children: [
              // 現在の文言: 中央から下へ（0.0 -> 1.0）
              FractionalTranslation(
                translation: Offset(0, progress),
                child: _BannerText(
                  text: _texts[_currentIndex],
                  style: textStyle,
                ),
              ),
              // 次の文言: 上から中央へ（-1.0 -> 0.0）
              FractionalTranslation(
                translation: Offset(0, progress - 1),
                child: _BannerText(
                  text: _texts[_nextIndex],
                  style: textStyle,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BannerText extends StatelessWidget {
  const _BannerText({
    required this.text,
    required this.style,
  });

  /// バナー内で共通利用するテキスト描画部品です。
  final String text;

  /// 呼び出し元で組み立てたテキストスタイルです。
  final TextStyle? style;

  @override
  /// 左寄せ・1行省略の表示形式を統一します。
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style,
      ),
    );
  }
}
