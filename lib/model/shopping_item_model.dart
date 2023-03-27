class ShoppingItemModel {
  final String name;
  final int quantity;
  final bool hasBought; //구매 여부
  final bool isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBought, //구매 여부
    required this.isSpicy,
  });

  ShoppingItemModel copyWith({
    String? name,
    int? quantity,
    bool? hasBought,
    bool? isSpicy,
  }) {
    return ShoppingItemModel(
      name: name ?? this.name, //name이 널일 경우 this.name(있던 값) 널이 아닐 경우 name(입력 받은 값)
      quantity: quantity ?? this.quantity,
      hasBought: hasBought ?? this.hasBought,
      isSpicy: isSpicy ?? this.isSpicy
    );
  }
}