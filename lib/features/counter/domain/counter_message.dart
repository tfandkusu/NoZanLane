import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_message.freezed.dart';

@freezed
abstract class CounterMessage with _$CounterMessage {
  const factory CounterMessage({
    required String description,
  }) = _CounterMessage;
}
