// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_local_data_store_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 現在時刻プロバイダ。

@ProviderFor(cycleNow)
final cycleNowProvider = CycleNowProvider._();

/// 現在時刻プロバイダ。

final class CycleNowProvider
    extends
        $FunctionalProvider<
          DateTime Function(),
          DateTime Function(),
          DateTime Function()
        >
    with $Provider<DateTime Function()> {
  /// 現在時刻プロバイダ。
  CycleNowProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cycleNowProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cycleNowHash();

  @$internal
  @override
  $ProviderElement<DateTime Function()> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DateTime Function() create(Ref ref) {
    return cycleNow(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime Function() value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime Function()>(value),
    );
  }
}

String _$cycleNowHash() => r'519059bfcaa423685b2fad1972cada1e9216a4fe';

/// CycleLocalDataStore の生成と初期化を担当する Provider。

@ProviderFor(cycleLocalDataStore)
final cycleLocalDataStoreProvider = CycleLocalDataStoreProvider._();

/// CycleLocalDataStore の生成と初期化を担当する Provider。

final class CycleLocalDataStoreProvider
    extends
        $FunctionalProvider<
          AsyncValue<CycleLocalDataStore>,
          CycleLocalDataStore,
          FutureOr<CycleLocalDataStore>
        >
    with
        $FutureModifier<CycleLocalDataStore>,
        $FutureProvider<CycleLocalDataStore> {
  /// CycleLocalDataStore の生成と初期化を担当する Provider。
  CycleLocalDataStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cycleLocalDataStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cycleLocalDataStoreHash();

  @$internal
  @override
  $FutureProviderElement<CycleLocalDataStore> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CycleLocalDataStore> create(Ref ref) {
    return cycleLocalDataStore(ref);
  }
}

String _$cycleLocalDataStoreHash() =>
    r'63d7a84f7922d1d519cbc2f87da3cfc894696a40';
