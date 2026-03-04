// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_local_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// CycleLocalDataSource の生成を担当する Provider。

@ProviderFor(cycleLocalDataSource)
final cycleLocalDataSourceProvider = CycleLocalDataSourceProvider._();

/// CycleLocalDataSource の生成を担当する Provider。

final class CycleLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<CycleLocalDataSource>,
          CycleLocalDataSource,
          FutureOr<CycleLocalDataSource>
        >
    with
        $FutureModifier<CycleLocalDataSource>,
        $FutureProvider<CycleLocalDataSource> {
  /// CycleLocalDataSource の生成を担当する Provider。
  CycleLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cycleLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cycleLocalDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<CycleLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CycleLocalDataSource> create(Ref ref) {
    return cycleLocalDataSource(ref);
  }
}

String _$cycleLocalDataSourceHash() =>
    r'9ce6f9347953f14f8563b54b0b650bb29117a767';
