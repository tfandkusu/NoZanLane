import 'package:no_zan_lane/data/local/service/cycle_local_data_source.dart';
import 'package:no_zan_lane/data/local/service/local_current_time.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_data_seed.g.dart';

/// ローカルデータ初期投入を担当するクラス。
class LocalDataSeed {
  /// コンストラクタ。
  ///
  /// 現在時刻は [LocalCurrentTime] から注入し、
  /// テスト時に固定時刻へ差し替えられるようにしている。
  const LocalDataSeed({required LocalCurrentTime currentTime})
    : _currentTime = currentTime;

  /// 初期サイクル生成の基準時刻を提供する依存。
  final LocalCurrentTime _currentTime;

  /// 初期データを投入する。
  ///
  /// すでに1件以上存在する場合は投入せず終了する。
  /// データが空の場合のみ、現在週を基準に
  /// 「先週・今週・来週」の3サイクルを生成する。
  Future<void> seedInitialData(
    CycleLocalDataSource cycleLocalDataSource,
  ) async {
    final existing = await cycleLocalDataSource.list();
    if (existing.isNotEmpty) {
      return;
    }

    final monday = _startOfWeek(_currentTime.now());
    final starts = [
      monday.subtract(const Duration(days: 7)),
      monday,
      monday.add(const Duration(days: 7)),
    ];

    for (final start in starts) {
      final end = start.add(const Duration(days: 7));
      await cycleLocalDataSource.add(startAt: start, endAt: end);
    }
  }

  /// 指定日時が含まれる週の月曜 00:00 を返す。
  ///
  /// 週の境界を固定することで、初期投入のサイクル開始日を
  /// 実行時刻に依存せず安定させる。
  DateTime _startOfWeek(DateTime dateTime) {
    final midnight = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final daysFromMonday = midnight.weekday - DateTime.monday;
    return midnight.subtract(Duration(days: daysFromMonday));
  }
}

/// LocalDataSeed を提供する Provider。
@riverpod
LocalDataSeed localDataSeed(Ref ref) {
  final currentTime = ref.watch(localCurrentTimeProvider);
  return LocalDataSeed(currentTime: currentTime);
}
