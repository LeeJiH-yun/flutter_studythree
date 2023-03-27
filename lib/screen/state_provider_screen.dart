import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_studythree/layout/defalut_layout.dart';
import 'package:flutter_studythree/riverpod/state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
      title: 'StateProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(provider.toString()),
            ElevatedButton(
                onPressed: (){
                  ref.read(numberProvider.notifier).update((state) => state + 1);
                },
                child: Text('UP')
            ),
            ElevatedButton(
              onPressed: (){
                ref.read(numberProvider.notifier).state =
                ref.read(numberProvider.notifier).state + 1;
              },
              child: Text('UP')
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => _NextScreen()));
              },
              child: Text('NextScreen')
            )
          ],
        ),
      )
    );
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(provider.toString()),
              ElevatedButton(
                onPressed: (){
                  ref.read(numberProvider.notifier).update((state) => state + 1);
                  //state = 현재 상태값이 들어온다.
                },
                child: Text('UP')
              )
            ],
          ),
        )
    );
  }
}
