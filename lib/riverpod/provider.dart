import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_studythree/model/shopping_item_model.dart';
import 'package:flutter_studythree/riverpod/state_notifier_provider.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>( //provider안에는 watch를 쓴다.
  (ref) {
    final filterState = ref.watch(filterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);

    if (filterState == FilterState.all){
      return shoppingListState;
    }

    return shoppingListState.where((element) =>
    filterState == FilterState.spicy ? element.isSpicy : !element.isSpicy).toList();
  }

);

enum FilterState{
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);