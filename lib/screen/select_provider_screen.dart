import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_studythree/layout/defalut_layout.dart';
import 'package:flutter_studythree/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(selectProvider.select((value) => value.isSpicy)); //value는 state(현재 값)이다.
    ref.listen(selectProvider.select((value) => value.hasBought), (previous, next) {

    });

    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              ref.read(selectProvider.notifier).toggleIsSpicy();
            }, child: Text('spicy toggle')),
            ElevatedButton(onPressed: (){
              ref.read(selectProvider.notifier).toggleHasBought();
            }, child: Text('bought toggle'))
          ],
        ),
      ),
    );
  }
}
