import 'package:no_zan_lane/data/local/cycle_local_data_store.dart';

/// CycleLocalDataStore の初期データ投入を担当するクラス。
class CycleLocalDataStoreSeed {
  /// コンストラクタ。
  const CycleLocalDataStoreSeed({DateTime Function()? now})
    : _now = now ?? DateTime.now;

  final DateTime Function() _now;

  /// サイクル初期データ（先週・今週・来週）を投入する。
  Future<void> seedInitialCycles(CycleLocalDataStore dataStore) async {
    final existing = await dataStore.list();
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
      await dataStore.add(startAt: start, endAt: end);
    }
  }

  DateTime _startOfWeek(DateTime dateTime) {
    final midnight = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final daysFromMonday = midnight.weekday - DateTime.monday;
    return midnight.subtract(Duration(days: daysFromMonday));
  }
}
