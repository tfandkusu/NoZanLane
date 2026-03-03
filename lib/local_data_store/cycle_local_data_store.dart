import 'package:drift/drift.dart';

/// サイクル1件を表す値オブジェクト。
class Cycle {
  /// コンストラクタ。
  const Cycle({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.startAt,
    required this.endAt,
  });

  /// プライマリーID。
  final int id;

  /// 作成日時。
  final DateTime createdAt;

  /// 更新日時。
  final DateTime updatedAt;

  /// サイクル開始日時。
  final DateTime startAt;

  /// サイクル終了日時。
  final DateTime endAt;
}

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
    final now = _now().toIso8601String();
    return _executor.runInsert(
      '''
      INSERT INTO cycles (created_at, updated_at, start_at, end_at)
      VALUES (?, ?, ?, ?)
      ''',
      [now, now, startAt.toIso8601String(), endAt.toIso8601String()],
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
            createdAt: DateTime.parse(_requiredString(row, 'created_at')),
            updatedAt: DateTime.parse(_requiredString(row, 'updated_at')),
            startAt: DateTime.parse(_requiredString(row, 'start_at')),
            endAt: DateTime.parse(_requiredString(row, 'end_at')),
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
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        start_at TEXT NOT NULL,
        end_at TEXT NOT NULL
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

  String _requiredString(Map<String, Object?> row, String key) {
    final value = row[key];
    if (value is String) {
      return value;
    }
    throw StateError('$key が String ではありません: $value');
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
