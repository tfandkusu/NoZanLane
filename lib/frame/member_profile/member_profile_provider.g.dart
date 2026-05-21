// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// MemberProfile 画面の状態を非同期で提供します。

@ProviderFor(MemberProfile)
final memberProfileProvider = MemberProfileProvider._();

/// MemberProfile 画面の状態を非同期で提供します。
final class MemberProfileProvider
    extends $AsyncNotifierProvider<MemberProfile, MemberProfileUiModel> {
  /// MemberProfile 画面の状態を非同期で提供します。
  MemberProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'memberProfileProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$memberProfileHash();

  @$internal
  @override
  MemberProfile create() => MemberProfile();
}

String _$memberProfileHash() => r'4d2d6dfdbaee8413dde220500e4b9112360c51d0';

/// MemberProfile 画面の状態を非同期で提供します。

abstract class _$MemberProfile extends $AsyncNotifier<MemberProfileUiModel> {
  FutureOr<MemberProfileUiModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<MemberProfileUiModel>, MemberProfileUiModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<MemberProfileUiModel>,
                MemberProfileUiModel
              >,
              AsyncValue<MemberProfileUiModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
