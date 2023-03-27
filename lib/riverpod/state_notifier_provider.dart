import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_studythree/model/shopping_item_model.dart';

final shoppingListProvider =
  StateNotifierProvider<ShoppingListNotifier,List<ShoppingItemModel>>((ref) => ShoppingListNotifier());
  //StateNotifier를 상속한 클래스를 위젯에서 사용하려면 provider로 만들어야하는데 이때 StateNotifierProvider를 사용해야 한다.
// <어떤 StateNotifier를 상속한 클래스를 사용할 건지, 그 클래스가 관리하는 상태의 타입> => 관리할 클래스를 인스턴스화

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  //상태 관리할 타입이 어떤 타입인지 지정이 필요하다.
  ShoppingListNotifier()
      : super(
      [
        ShoppingItemModel(
            name: '김치',
            quantity: 3,
            hasBought: false,
            isSpicy: true
        ),
        ShoppingItemModel(
            name: '라면',
            quantity: 5,
            hasBought: false,
            isSpicy: true
        ),
        ShoppingItemModel(
            name: '삼겹살',
            quantity: 10,
            hasBought: false,
            isSpicy: false
        ),
        ShoppingItemModel(
            name: '수박바',
            quantity: 1,
            hasBought: true,
            isSpicy: false
        ),
        ShoppingItemModel(
            name: '파인애플',
            quantity: 2,
            hasBought: false,
            isSpicy: false
        )
      ]
  );

  void toggleHasBought({required String name}) {
    state = state.map((e) => //state 는 클래스 안의 상태
    e.name == name ? ShoppingItemModel(
        name: e.name,
        quantity: e.quantity,
        hasBought: !e.hasBought,
        isSpicy: e.isSpicy
    ) : e).toList();
  }
}
