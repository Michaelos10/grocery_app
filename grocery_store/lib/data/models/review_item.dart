import 'grocery_item.dart';

class ReviewItem {
  final GroceryItem item; // The grocery item being reviewed
  final String productDetails; // Short description
  final String nutritions; // Nutrition info
  final double rating; // Rating in stars (0.0 to 5.0)
  final int quantity; // How many units of the item (optional, but useful)

  ReviewItem({
    required this.item,
    this.productDetails = '',
    this.nutritions = '',
    this.rating = 0.0,
    this.quantity = 1,
  });

  factory ReviewItem.fromMap(Map<String, dynamic> map) {
    return ReviewItem(
      item: GroceryItem.fromMap(map['item']),
      productDetails: map['productDetails'] ?? '',
      nutritions: map['nutritions'] ?? '',
      rating: (map['rating'] ?? 0.0).toDouble(),
      quantity: map['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'item': item.toMap(),
      'productDetails': productDetails,
      'nutritions': nutritions,
      'rating': rating,
      'quantity': quantity,
    };
  }

  // Helper to get total price
  double getTotalPrice() {
    return item.price * quantity;
  }

  // Helper to get size string from weight
  String getSize() {
    if (item.weight >= 1) {
      return '${item.weight.toStringAsFixed(1)} kg';
    } else {
      return '${(item.weight * 1000).toInt()} g';
    }
  }
}
