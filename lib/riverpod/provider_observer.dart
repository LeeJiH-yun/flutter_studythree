import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver{
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    //ProviderBase: 어떤 provider가 업데이트 됐는지
    //previousValue: 기존값 newValue: 다음값
  }

  @override
  void didAddProvider(ProviderBase provider, Object? value, ProviderContainer container) {
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer containers) {
    super.didDisposeProvider(provider, containers);
  }
}
