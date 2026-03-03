import 'package:drift/drift.dart';
import 'package:no_zan_lane/data/entity/cycle.dart';

/// サイクルを SQLite に保存するローカルデータストア。
class CycleLocalDataStore {
  CycleLocalDataStore._({
    required QueryExecutor executor,
    DateTime Function()? now,
  }) : _executor = executor,
       _now = now ?? DateTime.now;

  final QueryExecutor _executor;
  final DateTime Function() _now;
  final _queryExecutorUser = _NoOpQueryExecutorUser();
  bool _isOpen = false;

  /// データストアを生成して初期化する。
  static Future<CycleLocalDataStore> create({
    required QueryExecutor executor,
    DateTime Function()? now,
  }) async {
    final store = CycleLocalDataStore._(executor: executor, now: now);
    await store._initialize();
    return store;
  }

  /// サイクルを1件追加し、挿入されたIDを返す。
  Future<int> add({
    required DateTime startAt,
    required DateTime endAt,
  }) async {
    await _ensureOpen();
    final now = _now().millisecondsSinceEpoch;
    return _executor.runInsert(
      '''
      INSERT INTO cycles (created_at, updated_at, start_at, end_at)
      VALUES (?, ?, ?, ?)
      ''',
      [now, now, startAt.millisecondsSinceEpoch, endAt.millisecondsSinceEpoch],
    );
  }

  /// サイクルを開始日時の昇順で全件返す。
  Future<List<Cycle>> list() async {
    await _ensureOpen();
    final rows = await _executor.runSelect(
      '''
      SELECT id, created_at, updated_at, start_at, end_at
      FROM cycles
      ORDER BY start_at ASC
      ''',
      const [],
    );

    return rows
        .map(
          (row) => Cycle(
            id: _requiredInt(row, 'id'),
            createdAt: DateTime.fromMillisecondsSinceEpoch(
              _requiredInt(row, 'created_at'),
            ),
            updatedAt: DateTime.fromMillisecondsSinceEpoch(
              _requiredInt(row, 'updated_at'),
            ),
            startAt: DateTime.fromMillisecondsSinceEpoch(
              _requiredInt(row, 'start_at'),
            ),
            endAt: DateTime.fromMillisecondsSinceEpoch(
              _requiredInt(row, 'end_at'),
            ),
          ),
        )
        .toList(growable: false);
  }

  /// DB 接続をクローズする。
  Future<void> close() => _executor.close();

  Future<void> _initialize() async {
    await _ensureOpen();
    await _executor.runCustom('''
      CREATE TABLE IF NOT EXISTS cycles (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL,
        start_at INTEGER NOT NULL,
        end_at INTEGER NOT NULL
      )
    ''');

    final countResult = await _executor.runSelect(
      'SELECT COUNT(*) AS count FROM cycles',
      const [],
    );

    final existingCount = _requiredInt(countResult.first, 'count');
    if (existingCount > 0) {
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
      await add(startAt: start, endAt: end);
    }
  }

  Future<void> _ensureOpen() async {
    if (_isOpen) {
      return;
    }

    await _executor.ensureOpen(_queryExecutorUser);
    _isOpen = true;
  }

  DateTime _startOfWeek(DateTime dateTime) {
    final midnight = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final daysFromMonday = midnight.weekday - DateTime.monday;
    return midnight.subtract(Duration(days: daysFromMonday));
  }

  int _requiredInt(Map<String, Object?> row, String key) {
    final value = row[key];
    if (value is int) {
      return value;
    }
    throw StateError('$key が int ではありません: $value');
  }
}

class _NoOpQueryExecutorUser implements QueryExecutorUser {
  @override
  int get schemaVersion => 1;

  @override
  Future<void> beforeOpen(
    QueryExecutor executor,
    OpeningDetails details,
  ) async {}
}
