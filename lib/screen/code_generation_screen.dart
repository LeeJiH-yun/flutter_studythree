import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_studythree/layout/defalut_layout.dart';
import 'package:flutter_studythree/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(number1: 10, number2: 20));


    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        children: [
          Text('State1: $state1'),
          state2.when(
            data: (data) {
              return Text(
                'State2: $data',
                textAlign: TextAlign.center,
              );
            },
            error: (err, stack) => Text(err.toString()), //에러났을 때
            loading: () =>
                Center(
                  child: CircularProgressIndicator(),
                ),
          ),
          state3.when(
            data: (data) {
              return Text(
                'State2: $data',
                textAlign: TextAlign.center,
              );
            },
            error: (err, stack) => Text(err.toString()), //에러났을 때
            loading: () =>
                Center(
                  child: CircularProgressIndicator(),
                ),
          ),
          Text('State4: $state4'),
          Consumer( //부분적 렌더링이 가능하다.
            builder: (context, ref, child){
              final state5 = ref.watch(gStateNotifierProvider);

              return Row( //이부분만 계속 렌더링이 된다.
                children: [
                  Text('State5: $state5'),
                  if (child != null) child
                ],
              );
            },
            child: Text('hello'), // child는 한번만 렌더링이 된다.
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: Text('increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).decrement();
                },
                child: Text('decrement'),
              )
            ],
          ),
          //invalidate() 유효하지 않게 하다: state를 초기의 상태로 되돌리는 역할을 한다.
          ElevatedButton(
            onPressed: () {
              ref.invalidate(gStateNotifierProvider);
            },
            child: Text(
                'Invalidate'
            ),
          )
        ],
      ),
    );
  }
}

class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state5 = ref.watch(gStateNotifierProvider);

    return Text('state5: $state5');
  }
}
