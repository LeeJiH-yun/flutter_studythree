import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_studythree/layout/defalut_layout.dart';
import 'package:flutter_studythree/riverpod/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multiplesFutureProvider); //state는 AsyncValue라는 상태로 들어오게 된다.

    return DefaultLayout(
      title: 'FutureProviderScreen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          state.when( //AsyncValue값을 처리하기 위해서 when을 사용
            data: (data){ //로딩이 끝나서 데이터가 있을 때 실행 하는 함수
              return Text( //data는 state값
                data.toString(),
                textAlign: TextAlign.center,
              );
            },
            error: (err, stack) => Text(
              err.toString()
            ), //에러났을 때
            loading: () => Center(child: CircularProgressIndicator(),), //로딩이 되고 있을때 실행 하는 함수
          )
        ],
      ),
    );
  }
}
