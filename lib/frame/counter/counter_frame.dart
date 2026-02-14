import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/component/ds_app_bar.dart';
import 'package:no_zan_lane/frame/counter/counter_ui_model.dart';
import 'package:no_zan_lane/l10n/app_localizations.dart';

/// カウンター画面の Frame 実装です。
class CounterFrame extends HookConsumerWidget {
  /// [CounterFrame] を生成します。
  const CounterFrame({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final uiModel = useState(const CounterUiModel(count: 0));

    return Scaffold(
      appBar: DSAppBar(titleText: l10n.counterPageTitle),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(l10n.counterDescription),
            Text(
              '${uiModel.value.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => uiModel.value = uiModel.value.copyWith(
          count: uiModel.value.count + 1,
        ),
        tooltip: l10n.incrementButtonTooltip,
        child: const Icon(Icons.add),
      ),
    );
  }
}
