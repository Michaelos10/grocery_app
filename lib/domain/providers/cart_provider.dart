import 'package:flutter/material.dart';
import '../../data/models/grocery_item.dart'; // Adjust path if needed

class CartProvider extends ChangeNotifier {
  final Map<GroceryItem, int> _items = {};

  Map<GroceryItem, int> get items => _items;

  double get totalPrice {
    return _items.entries
        .fold(0.0, (sum, entry) => sum + entry.key.price * entry.value);
  }

  int get itemCount => _items.length;

  void addItem(GroceryItem item) {
    if (_items.containsKey(item)) {
      _items[item] = _items[item]! + 1;
    } else {
      _items[item] = 1;
    }
    notifyListeners();
  }

  void removeItem(GroceryItem item) {
    if (_items.containsKey(item)) {
      if (_items[item]! > 1) {
        _items[item] = _items[item]! - 1;
      } else {
        _items.remove(item);
      }
      notifyListeners();
    }
  }

  void removeAllItemsByName(String itemName) {
    // Collect all matching items by name
    final itemsToRemove = _items.keys
        .where((item) => item.name.toLowerCase() == itemName.toLowerCase())
        .toList();

    // Remove them from the cart
    for (final item in itemsToRemove) {
      _items.remove(item);
    }

    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  bool isInCart(GroceryItem item) {
    return _items.containsKey(item);
  }

  int getQuantity(GroceryItem item) {
    return _items[item] ?? 0;
  }
}
