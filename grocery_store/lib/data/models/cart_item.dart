import 'grocery_item.dart';

class CartItem {
  final GroceryItem item; // Reference to the GroceryItem
  int quantity; // Quantity of this item in the cart

  CartItem({
    required this.item,
    this.quantity = 1, // Default quantity is 1 if not specified
  });

  // Method to increase quantity
  void increaseQuantity() {
    quantity++;
  }

  // Method to decrease quantity
  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  // Method to get the total price for this item in the cart
  double getTotalPrice() {
    return item.price * quantity;
  }

  // Factory constructor to create a CartItem from a Map
  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      item: GroceryItem.fromMap(map['item']),
      quantity: map['quantity'] ?? 1,
    );
  }

  // Convert CartItem back to a Map
  Map<String, dynamic> toMap() {
    return {
      'item': item.toMap(),
      'quantity': quantity,
    };
  }
}
