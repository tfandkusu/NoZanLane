import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/app/app.dart';
import 'package:no_zan_lane/component/ds_profile_main_photo.dart';

void main() {
  testWidgets('MemberProfileFrame が初期表示される', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));
    await tester.pumpAndSettle();

    expect(find.byType(DSProfileMainPhoto), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -400));
    await tester.pumpAndSettle();

    expect(find.text('自己紹介文'), findsOneWidget);
    expect(
      find.textContaining('はじめまして。プロフィールをご覧いただきありがとうございます'),
      findsOneWidget,
    );
  });
}
