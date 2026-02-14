import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_message.freezed.dart';

/// カウンター画面に表示する文言のドメインモデルです。
@freezed
abstract class CounterMessage with _$CounterMessage {
  /// [CounterMessage] を生成します。
  const factory CounterMessage({
    required String description,
  }) = _CounterMessage;
}
