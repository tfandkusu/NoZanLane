// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_message_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(counterMessage)
final counterMessageProvider = CounterMessageProvider._();

final class CounterMessageProvider
    extends $FunctionalProvider<CounterMessage, CounterMessage, CounterMessage>
    with $Provider<CounterMessage> {
  CounterMessageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'counterMessageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$counterMessageHash();

  @$internal
  @override
  $ProviderElement<CounterMessage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CounterMessage create(Ref ref) {
    return counterMessage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CounterMessage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CounterMessage>(value),
    );
  }
}

String _$counterMessageHash() => r'c9d39632fbf56d8ddb92a1d46219edb46efd634d';
