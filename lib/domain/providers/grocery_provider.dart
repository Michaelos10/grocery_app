import 'package:flutter/material.dart';
import '../../data/models/exported_model_files.dart';
import '../../data/data_sources/mock_data.dart';

class GroceryProvider with ChangeNotifier {
  String _activeCategory = 'allData'; // Default
  String get activeCategory => _activeCategory;

  List<ReviewItem> _groceryItems = ProductData.allData;
  List<ReviewItem> get groceryItems => _groceryItems;

  List<ReviewItem> _filteredItems = [];
  List<ReviewItem> get filteredItems =>
      _filteredItems.isEmpty ? _groceryItems : _filteredItems;

  final List<GroceryItem> _cartItems = [];
  List<GroceryItem> get cartItems => _cartItems;

  void addToCart(GroceryItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(GroceryItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void searchItems(String query) {
    if (query.isEmpty) {
      _filteredItems = [];
    } else {
      _filteredItems = _groceryItems
          .where((reviewItem) =>
              reviewItem.item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void clearSearch() {
    _filteredItems = _groceryItems; // [];
    notifyListeners();
  }

  void setCategories(List<String> selectedKeys) {
    if (selectedKeys.isEmpty) {
      _groceryItems = ProductData.categoryMap.values
          .expand<ReviewItem>((list) => list)
          .toList();
    } else {
      _groceryItems = selectedKeys
          .expand<ReviewItem>((key) => ProductData.categoryMap[key] ?? [])
          .toList();
    }
    notifyListeners();
  }
}
