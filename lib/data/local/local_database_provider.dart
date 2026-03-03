import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_database_provider.g.dart';

/// ローカル DB が利用する QueryExecutor を提供する Provider。
@riverpod
QueryExecutor localDatabaseExecutor(Ref ref) {
  throw UnimplementedError('localDatabaseExecutorProvider を override してください。');
}

/// DB 生成関数の型。
typedef LocalDatabaseBuilder<TDatabase extends GeneratedDatabase> =
    TDatabase Function(QueryExecutor executor);

/// ローカル DB の生成と初期化を担当するクラス。
class LocalDatabaseInitializer {
  /// 指定した DB を生成し、初期化まで完了したインスタンスを返す。
  Future<TDatabase> initializeDatabase<TDatabase extends GeneratedDatabase>({
    required QueryExecutor executor,
    required LocalDatabaseBuilder<TDatabase> databaseBuilder,
  }) async {
    final database = databaseBuilder(executor);
    await database.customSelect('SELECT 1').getSingle();
    return database;
  }
}

/// ローカル DB 初期化クラスを提供する Provider。
@riverpod
LocalDatabaseInitializer localDatabaseInitializer(Ref ref) {
  return LocalDatabaseInitializer();
}
