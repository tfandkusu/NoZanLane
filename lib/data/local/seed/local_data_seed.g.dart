// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_data_seed.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// LocalDataSeed を提供する Provider。

@ProviderFor(localDataSeed)
final localDataSeedProvider = LocalDataSeedProvider._();

/// LocalDataSeed を提供する Provider。

final class LocalDataSeedProvider
    extends $FunctionalProvider<LocalDataSeed, LocalDataSeed, LocalDataSeed>
    with $Provider<LocalDataSeed> {
  /// LocalDataSeed を提供する Provider。
  LocalDataSeedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localDataSeedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localDataSeedHash();

  @$internal
  @override
  $ProviderElement<LocalDataSeed> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocalDataSeed create(Ref ref) {
    return localDataSeed(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalDataSeed value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalDataSeed>(value),
    );
  }
}

String _$localDataSeedHash() => r'18c727cefd5d38cafafd37098fe6a73914ddc5bc';
