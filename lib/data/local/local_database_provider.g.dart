// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ローカル DB が利用する QueryExecutor を提供する Provider。

@ProviderFor(localDatabaseExecutor)
final localDatabaseExecutorProvider = LocalDatabaseExecutorProvider._();

/// ローカル DB が利用する QueryExecutor を提供する Provider。

final class LocalDatabaseExecutorProvider
    extends $FunctionalProvider<QueryExecutor, QueryExecutor, QueryExecutor>
    with $Provider<QueryExecutor> {
  /// ローカル DB が利用する QueryExecutor を提供する Provider。
  LocalDatabaseExecutorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localDatabaseExecutorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localDatabaseExecutorHash();

  @$internal
  @override
  $ProviderElement<QueryExecutor> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QueryExecutor create(Ref ref) {
    return localDatabaseExecutor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QueryExecutor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QueryExecutor>(value),
    );
  }
}

String _$localDatabaseExecutorHash() =>
    r'f6f1d8f61839a16aa7c1d40a1d39cfc7f0407d12';

/// ローカル DB 初期化クラスを提供する Provider。

@ProviderFor(localDatabaseInitializer)
final localDatabaseInitializerProvider = LocalDatabaseInitializerProvider._();

/// ローカル DB 初期化クラスを提供する Provider。

final class LocalDatabaseInitializerProvider
    extends
        $FunctionalProvider<
          LocalDatabaseInitializer,
          LocalDatabaseInitializer,
          LocalDatabaseInitializer
        >
    with $Provider<LocalDatabaseInitializer> {
  /// ローカル DB 初期化クラスを提供する Provider。
  LocalDatabaseInitializerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localDatabaseInitializerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localDatabaseInitializerHash();

  @$internal
  @override
  $ProviderElement<LocalDatabaseInitializer> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalDatabaseInitializer create(Ref ref) {
    return localDatabaseInitializer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalDatabaseInitializer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalDatabaseInitializer>(value),
    );
  }
}

String _$localDatabaseInitializerHash() =>
    r'fe4ee4af112bdaa9822d94353d35cf41e84564c4';
