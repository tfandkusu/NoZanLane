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

  final String primaryText;
  final String secondaryText;

  @override
  State<_AnimatedBannerTexts> createState() => _AnimatedBannerTextsState();
}

class _AnimatedBannerTextsState extends State<_AnimatedBannerTexts>
    with SingleTickerProviderStateMixin {
  static const _switchInterval = Duration(seconds: 4);
  static const _animationDuration = Duration(milliseconds: 200);

  late final AnimationController _controller;
  Timer? _timer;
  int _currentIndex = 0;
  int _nextIndex = 1;
  bool _isAnimating = false;

  List<String> get _texts => [widget.primaryText, widget.secondaryText];

  bool get _shouldAnimate => widget.primaryText != widget.secondaryText;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addStatusListener(_handleAnimationStatusChanged);
    _restartTimer();
  }

  @override
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
  void dispose() {
    _timer?.cancel();
    _controller
      ..removeStatusListener(_handleAnimationStatusChanged)
      ..dispose();
    super.dispose();
  }

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
          child: Stack(
            children: [
              FractionalTranslation(
                translation: Offset(0, progress),
                child: _BannerText(
                  text: _texts[_currentIndex],
                  style: textStyle,
                ),
              ),
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

  final String text;
  final TextStyle? style;

  @override
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
