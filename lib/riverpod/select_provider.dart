import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_studythree/model/shopping_item_model.dart';

final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>((ref) => SelectNotifier());

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier() :
        super(
          ShoppingItemModel(
            name: 'xhlrms',
            quantity: 5,
            hasBought: true,
            isSpicy: true,
          )
        );

  toggleHasBought() {
    state = state.copyWith(
      hasBought: !state.hasBought
    );

    // state = ShoppingItemModel(
    //   name: state.name,
    //   quantity: state.quantity,
    //   hasBought: !state.hasBought,
    //   isSpicy: state.isSpicy,
    // );
  }

  toggleIsSpicy() {
    // state = ShoppingItemModel(
    //   name: state.name,
    //   quantity: state.quantity,
    //   hasBought: state.hasBought,
    //   isSpicy: !state.isSpicy,
    // ); //하단과 같은 코드이다.

    state = state.copyWith(
      isSpicy: !state.isSpicy
    );
  }
}