import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_current_time.g.dart';

/// 現在時刻を返却するサービス。
class LocalCurrentTime {
  /// 現在時刻を返す。
  DateTime now() => DateTime.now();
}

/// LocalCurrentTime を提供する Provider。
@riverpod
LocalCurrentTime localCurrentTime(Ref ref) {
  return LocalCurrentTime();
}
