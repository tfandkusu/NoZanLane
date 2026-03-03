import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/seed/seed_issue.dart';

/// 起動時に読み込んだ Issue シード一覧を提供します。
final seedIssueListProvider = Provider<List<SeedIssue>>((ref) => const []);
