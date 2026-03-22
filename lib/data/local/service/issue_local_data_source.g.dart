// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_local_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// IssueLocalDataSource の生成を担当する Provider。

@ProviderFor(issueLocalDataSource)
final issueLocalDataSourceProvider = IssueLocalDataSourceProvider._();

/// IssueLocalDataSource の生成を担当する Provider。

final class IssueLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<IssueLocalDataSource>,
          IssueLocalDataSource,
          FutureOr<IssueLocalDataSource>
        >
    with
        $FutureModifier<IssueLocalDataSource>,
        $FutureProvider<IssueLocalDataSource> {
  /// IssueLocalDataSource の生成を担当する Provider。
  IssueLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'issueLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$issueLocalDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<IssueLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<IssueLocalDataSource> create(Ref ref) {
    return issueLocalDataSource(ref);
  }
}

String _$issueLocalDataSourceHash() =>
    r'068e655905510b751a6077a52cc12124a1302c39';
