import 'package:no_zan_lane/features/counter/domain/counter_message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_message_provider.g.dart';

/// Provides a localized message model for the counter screen.
@riverpod
CounterMessage counterMessage(Ref ref) {
  return const CounterMessage(description: 'counterDescription');
}
