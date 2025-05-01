class GroceryItem {
  final String id; // Unique identifier for the item
  final String name; // Name of the grocery item (e.g., "Apple")
  final String image; // Path to the image or image URL
  final double weight; // Weight of the item (e.g., 1.2 kg or 300 g)
  final double price; // Price of the item

  GroceryItem({
    required this.id,
    required this.name,
    required this.image,
    required this.weight,
    required this.price,
  });

  // Factory constructor to create an instance from a map (useful when parsing from JSON)
  factory GroceryItem.fromMap(Map<String, dynamic> map) {
    return GroceryItem(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      weight: map['weight'].toDouble(),
      price: map['price'].toDouble(),
    );
  }

  // Method to convert GroceryItem back to a map (useful for storing or sending data)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'weight': weight,
      'price': price,
    };
  }
}
