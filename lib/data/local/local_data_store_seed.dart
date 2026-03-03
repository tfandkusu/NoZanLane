import 'package:no_zan_lane/data/local/cycle_local_data_store.dart';

/// ローカルデータストアの初期データ投入を担当するクラス。
class LocalDataStoreSeed {
  /// コンストラクタ。
  const LocalDataStoreSeed({DateTime Function()? now})
    : _now = now ?? DateTime.now;

  final DateTime Function() _now;

  /// 初期データを投入する。
  Future<void> seedInitialData(CycleLocalDataStore cycleLocalDataStore) async {
    final existing = await cycleLocalDataStore.list();
    if (existing.isNotEmpty) {
      return;
    }

    final monday = _startOfWeek(_now());
    final starts = [
      monday.subtract(const Duration(days: 7)),
      monday,
      monday.add(const Duration(days: 7)),
    ];

    for (final start in starts) {
      final end = start.add(const Duration(days: 7));
      await cycleLocalDataStore.add(startAt: start, endAt: end);
    }
  }

  DateTime _startOfWeek(DateTime dateTime) {
    final midnight = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final daysFromMonday = midnight.weekday - DateTime.monday;
    return midnight.subtract(Duration(days: daysFromMonday));
  }
}
