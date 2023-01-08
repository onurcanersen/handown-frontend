import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["laptop", "150.00", "assets/images/laptop.png", Colors.green],
    ["phone", "499.00", "assets/images/phone.png", Colors.red],
    ["boot", "200.00", "assets/images/boot.png", Colors.teal],
    ["gamepad", "50", "assets/images/gamepad.png", Colors.blue],
    ["shirt", "20.00", "assets/images/shirt.png", Colors.brown],
  ];

  // list of cart items
  List _cartItems = [];
  get cartItems => _cartItems;
  get shopItems => _shopItems;

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void removeAllFromCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
