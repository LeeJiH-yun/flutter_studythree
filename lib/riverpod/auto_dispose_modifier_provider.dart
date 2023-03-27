import 'package:flutter_riverpod/flutter_riverpod.dart';

final autoDisposeModifierProvider = FutureProvider.autoDispose<List<int>>((ref) async {
  //캐시를 자동으로 삭제해서 처음부터 다시 실행한다. = autoDispose
  //즉 사용하지 않을 때는 데이터가 삭제되야하는 provider를 사용해야할 경우 autoDispose를 사용한다.
  await Future.delayed(Duration(seconds: 2));

  return [1,2,3,4,5];
});