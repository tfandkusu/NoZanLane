import 'package:no_zan_lane/features/counter/domain/counter_message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_message_provider.g.dart';

@riverpod
CounterMessage counterMessage(Ref ref) {
  return const CounterMessage(description: 'counterDescription');
}
