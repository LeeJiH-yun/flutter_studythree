import 'package:flutter_riverpod/flutter_riverpod.dart';

final multiplesFutureProvider = FutureProvider<List<int>>((ref) async {
  await Future.delayed(
    Duration(seconds: 2)
  );

  //throw Exception('에러랍니다.'); 에러 확인

  return [1,2,3,4,5];
});