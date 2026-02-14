import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/features/counter/application/counter_message_provider.dart';
import 'package:no_zan_lane/l10n/app_localizations.dart';

class CounterPage extends HookConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final counter = useState<int>(0);
    final message = ref.watch(counterMessageProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterPageTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message.description == 'counterDescription'
                  ? l10n.counterDescription
                  : message.description,
            ),
            Text(
              '${counter.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value++,
        tooltip: l10n.incrementButtonTooltip,
        child: const Icon(Icons.add),
      ),
    );
  }
}
