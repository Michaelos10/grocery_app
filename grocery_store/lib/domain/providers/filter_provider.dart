import 'package:flutter/material.dart';

class FilterProvider with ChangeNotifier {
  final Map<String, bool> _categories = {
    "Eggs": false,
    "Dairy": false,
    "Noodles & Pasta": false,
    "Fruits": false,
    "Fast Food": false,
    "Vegetables": false,
  };

  final Map<String, bool> _brands = {
    "Individual Collection": false,
    "Cocola": false,
    "Ifad": false,
    "Kazi Farmas": false,
  };

  Map<String, bool> get categories => _categories;
  Map<String, bool> get brands => _brands;

  void toggleCategory(String key, bool value) {
    _categories[key] = value;
    notifyListeners();
  }

  void toggleBrand(String key, bool value) {
    _brands[key] = value;
    notifyListeners();
  }
}
