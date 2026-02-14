import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_message.freezed.dart';

/// Domain model for text shown on the counter page.
@freezed
abstract class CounterMessage with _$CounterMessage {
  /// Creates a [CounterMessage].
  const factory CounterMessage({
    required String description,
  }) = _CounterMessage;
}
