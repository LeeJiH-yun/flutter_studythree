import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 1. 어떤 provider를 사용할지 결정할, 고민할 필요 없도록 (provider,futureprovider..)

final _testProvider = Provider<String>((ref) => 'Hello Code Generation');

@riverpod
String gState(GStateRef ref) { //항상 받아야 하는 파라미터 = 함수명+Ref
  return 'Hello Code Generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async{
  await Future.delayed(Duration(seconds: 3));

  return 10;
}

@Riverpod( //autodispose 되지 않게 설정
  keepAlive: true, //값을 계속 살려두기 위함 default= false
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async{
  await Future.delayed(Duration(seconds: 3));

  return 10;
}

// 2. parameter > family 파라미터를 일반 함수처럼 사용할 수 있도록
class Parameter{
  final int number1;
  final int number2;

  Parameter({
    required this.number1,
    required this.number2
  });
}

final _testFamilyProvider = Provider.family<int, Parameter>(
    (ref, parameter) => parameter.number1 * parameter.number2,
);

@riverpod
int gStateMultiply(GStateMultiplyRef ref, {
  required int number1,
  required int number2
}){
  return number1 * number2;
}

@riverpod
class GStateNotifier extends _$GStateNotifier{ //_$클래스이름
  @override
  int build(){ //초기 상태값을 지정해주는 것이 필요하다.
    return 0;
  }

  increment(){
    state ++;
  }
  decrement(){
    state --;
  }
}