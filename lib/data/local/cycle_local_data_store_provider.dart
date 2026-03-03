import 'package:no_zan_lane/data/local/cycle_local_data_store.dart';
import 'package:no_zan_lane/data/local/local_database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cycle_local_data_store_provider.g.dart';

/// 現在時刻プロバイダ。
@riverpod
DateTime Function() cycleNow(Ref ref) {
  return DateTime.now;
}

/// CycleLocalDataStore の生成と初期化を担当する Provider。
@riverpod
Future<CycleLocalDataStore> cycleLocalDataStore(Ref ref) async {
  final executor = ref.watch(localDatabaseExecutorProvider);
  final databaseInitializer = ref.watch(localDatabaseInitializerProvider);
  final now = ref.watch(cycleNowProvider);

  final database = await databaseInitializer
      .initializeDatabase<CycleLocalDataStoreDatabase>(
        executor: executor,
        databaseBuilder: (queryExecutor) =>
            CycleLocalDataStoreDatabase(executor: queryExecutor),
      );
  ref.onDispose(database.close);

  return CycleLocalDataStore(database: database, now: now);
}
