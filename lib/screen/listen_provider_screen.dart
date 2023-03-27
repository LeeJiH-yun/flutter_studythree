import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_studythree/layout/defalut_layout.dart';
import 'package:flutter_studythree/riverpod/listen_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(
      length: 10,
      vsync: this, //vsync는 this를 넣어줘야한다.
      initialIndex: ref.read(listenProvider), //initState에서는 watch를 하면 안된다. 단발적이기 때문에
    );
  }

  @override
  Widget build(BuildContext context) {

    ref.listen<int>(listenProvider, (previous, next) {
      if (previous != next) {
        controller.animateTo(
          next,
        );
      }
    });

    return DefaultLayout(
        title: 'ListenProviderScreen',
        body: TabBarView(
            physics: NeverScrollableScrollPhysics(), //스크롤 안되게
            controller: controller,
            children: List.generate(
                10,
                (index) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(index.toString()),
                        ElevatedButton(
                          onPressed: (){
                            ref.read(listenProvider.notifier).update((state) => state == 10 ? 10 : state + 1);
                            //마지막 페이지까지 갔으면 10 반환(10페이지)
                          },
                          child: Text('다음'),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            ref.read(listenProvider.notifier).update((state) => state == 0 ? 0 : state - 1);
                          },
                          child: Text('뒤로'),
                        )
                      ],
                    )
            )
        )
    );
  }
}
