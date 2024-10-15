import 'package:burgershop/db/itemDB.dart';
import 'package:flutter/material.dart';

//State Manager for updating Cart Number bubble in homepage
class CartModel with ChangeNotifier {
  List get _shoppingCart => shoppingCart;

  void addItem(int item) {
    _shoppingCart.add(item);
    notifyListeners();
  }

  void deleteItem(int item) {
    _shoppingCart.remove(item);
    notifyListeners();
  }
}
