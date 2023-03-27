import 'package:flutter_riverpod/flutter_riverpod.dart';

final multipleStreamProvider = StreamProvider<List<int>>((ref) async*{ //stream은 async*해야함
  for(int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));

    yield List.generate(3, (index) => index * i);
  }
});