import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyModifierProvider = FutureProvider.family<List<int>, int>((ref, data) async{
  //family는 두번째 파라미터도 받아야한다.
  //provider를 생성할 때 생성하는 순간에 변수를 입력해줘서 변수로 provider 로직을 변경 해야 할 때
  await Future.delayed(Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
});