// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_current_time.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// LocalCurrentTime を提供する Provider。

@ProviderFor(localCurrentTime)
final localCurrentTimeProvider = LocalCurrentTimeProvider._();

/// LocalCurrentTime を提供する Provider。

final class LocalCurrentTimeProvider
    extends
        $FunctionalProvider<
          LocalCurrentTime,
          LocalCurrentTime,
          LocalCurrentTime
        >
    with $Provider<LocalCurrentTime> {
  /// LocalCurrentTime を提供する Provider。
  LocalCurrentTimeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localCurrentTimeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localCurrentTimeHash();

  @$internal
  @override
  $ProviderElement<LocalCurrentTime> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocalCurrentTime create(Ref ref) {
    return localCurrentTime(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalCurrentTime value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalCurrentTime>(value),
    );
  }
}

String _$localCurrentTimeHash() => r'5c8eff620e4a00172a7912bdae658cefd01d551b';
