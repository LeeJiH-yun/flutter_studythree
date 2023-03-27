import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_studythree/layout/defalut_layout.dart';
import 'package:flutter_studythree/riverpod/provider.dart';
import 'package:flutter_studythree/riverpod/state_notifier_provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingListProvider);

    return DefaultLayout(
      title: 'ProviderScreen',
      actions: [
        PopupMenuButton<FilterState>(
          itemBuilder: (_) => FilterState.values
          .map((e) => PopupMenuItem(
            value: e,
            child: Text(
              e.name
            ),
          )).toList(),
          onSelected: (value){
            ref.read(filterProvider.notifier).update((state) => value);
          },
        )
      ],
      body: ListView(
        children: state
          .map((e) => CheckboxListTile(
              value: e.hasBought, //체크박스가 체크 된 지 여부
              title: Text(e.name),
              onChanged: (value) {
                ref
                    .read(shoppingListProvider.notifier)
                    .toggleHasBought(name: e.name);
                //액션을 취했을 때 단발적으로 실행하는 것 = read
              }) //체크박스를 누를 때마다
            )
          .toList(),
      ),
    );
  }
}
