// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_local_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// StatusLocalDataSource の生成を担当する Provider。

@ProviderFor(statusLocalDataSource)
final statusLocalDataSourceProvider = StatusLocalDataSourceProvider._();

/// StatusLocalDataSource の生成を担当する Provider。

final class StatusLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<StatusLocalDataSource>,
          StatusLocalDataSource,
          FutureOr<StatusLocalDataSource>
        >
    with
        $FutureModifier<StatusLocalDataSource>,
        $FutureProvider<StatusLocalDataSource> {
  /// StatusLocalDataSource の生成を担当する Provider。
  StatusLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'statusLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$statusLocalDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<StatusLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<StatusLocalDataSource> create(Ref ref) {
    return statusLocalDataSource(ref);
  }
}

String _$statusLocalDataSourceHash() =>
    r'9fbcb048e46051dbb32b4866fe726c68a8abccb8';
