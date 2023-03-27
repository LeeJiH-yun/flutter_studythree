import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_studythree/riverpod/provider_observer.dart';
import 'package:flutter_studythree/screen/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [ //provider를 관찰하는 기능을 넣을 수 있다.
        Logger(),

      ],
      child: MaterialApp(
          home: HomeScreen()
      )
    )
  );
}
