import 'package:no_zan_lane/data/local/service/cycle_local_data_source.dart';
import 'package:no_zan_lane/data/local/service/local_current_time.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_data_seed.g.dart';

/// ローカルデータ初期投入を担当するクラス。
class LocalDataSeed {
  /// コンストラクタ。
  const LocalDataSeed({required LocalCurrentTime currentTime})
    : _currentTime = currentTime;

  final LocalCurrentTime _currentTime;

  /// 初期データを投入する。
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
