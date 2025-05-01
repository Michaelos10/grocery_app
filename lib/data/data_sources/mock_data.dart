import '../models/grocery_item.dart';
import '../models/review_item.dart';

class ProductData {
  static List<ReviewItem> Fruits = [
    ReviewItem(
      item: GroceryItem(
        id: '1',
        name: 'Organic Bananas',
        image: 'assets/images/products/banana.png',
        weight: 7,
        price: 4.99,
      ),
      productDetails: 'Fresh organic bananas from the farm.',
      nutritions: 'Rich in potassium and fiber.',
      rating: 4.8,
    ),
    ReviewItem(
      item: GroceryItem(
        id: '2',
        name: 'Red Apple',
        image: 'assets/images/products/apple.png',
        weight: 1,
        price: 4.99,
      ),
      productDetails: 'Sweet and juicy red apples.',
      nutritions: 'High in vitamins and antioxidants.',
      rating: 4.7,
    ),
  ];
  static List<ReviewItem> Eggs = [
    ReviewItem(
      item: GroceryItem(
        id: '3',
        name: 'Egg Chicken Red',
        image: 'assets/images/products/redEgg.png',
        weight: 4,
        price: 1.99,
      ),
      productDetails: 'Farm fresh red chicken eggs.',
      nutritions: 'Good source of protein.',
      rating: 4.5,
    ),
    ReviewItem(
      item: GroceryItem(
        id: '4',
        name: 'Egg Chicken White',
        image: 'assets/images/products/whiteEgg.png',
        weight: 6,
        price: 1.50,
      ),
      productDetails: 'High-quality white chicken eggs.',
      nutritions: 'Protein-rich with essential nutrients.',
      rating: 4.6,
    ),
  ];

  static List<ReviewItem> Pasta = [
    ReviewItem(
      item: GroceryItem(
        id: '5',
        name: 'Egg Pasta',
        image: 'assets/images/products/eggPasta.png',
        weight: 0.3,
        price: 15.99,
      ),
      productDetails: 'Delicious egg pasta perfect for quick meals.',
      nutritions: 'High in carbs and proteins.',
      rating: 4.2,
    ),
    ReviewItem(
      item: GroceryItem(
        id: '6',
        name: 'Egg Noodles',
        image: 'assets/images/products/eggNoodles.png',
        weight: 0.21,
        price: 15.99,
      ),
      productDetails: 'Tasty egg noodles, easy to prepare.',
      nutritions: 'Contains carbs and essential minerals.',
      rating: 4.0,
    ),
  ];

  static List<ReviewItem> Dairy = [
    ReviewItem(
      item: GroceryItem(
        id: '9',
        name: 'Beef Bone',
        image: 'assets/images/products/redMeat.png',
        weight: 1,
        price: 4.99,
      ),
      productDetails: 'Fresh beef bone, ideal for soups.',
      nutritions: 'Rich in collagen and minerals.',
      rating: 4.5,
    ),
    ReviewItem(
      item: GroceryItem(
        id: '10',
        name: 'Broiler Chicken',
        image: 'assets/images/products/chicken.png',
        weight: 1,
        price: 4.99,
      ),
      productDetails: 'Tender broiler chicken for cooking.',
      nutritions: 'High-quality protein source.',
      rating: 4.6,
    ),
  ];

  // Best Selling (other items)
  static List<ReviewItem> Vegetables = [
    ReviewItem(
      item: GroceryItem(
        id: '8',
        name: 'Bell Pepper Red',
        image: 'assets/images/products/pepper.png',
        weight: 1,
        price: 4.99,
      ),
      productDetails: 'Chilling pepper red',
      nutritions: 'Contains carbs and essential minerals.',
      rating: 4.0,
    ),
    ReviewItem(
      item: GroceryItem(
        id: '7',
        name: 'Ginger',
        image: 'assets/images/products/ginger.png',
        weight: 0.25,
        price: 2.99,
      ),
      productDetails: 'Tasty egg noodles, easy to prepare.',
      nutritions: 'Contains carbs and essential minerals.',
      rating: 4.0,
    ),
  ];

  static List<ReviewItem> Fastfood = [
    ReviewItem(
      item: GroceryItem(
        id: '11',
        name: 'Pulses',
        image: 'assets/images/products/pulse.png',
        weight: 1,
        price: 4.99,
      ),
      productDetails: 'Tender pulses for cooking.',
      nutritions: 'High-quality protein source.',
      rating: 4.6,
    ),
    ReviewItem(
      item: GroceryItem(
        id: '12',
        name: 'Rice Cake',
        image: 'assets/images/products/cake.png',
        weight: 1,
        price: 4.99,
      ),
      productDetails: 'Seasoned Rice cakes.',
      nutritions: 'High-quality carbohydrate source.',
      rating: 4.6,
    ),
  ];
// Map for string access
  static final Map<String, List<ReviewItem>> categoryMap = {
    "Fruits": Fruits,
    "Dairy": Dairy,
    "Fastfood": Fastfood,
    "Eggs": Eggs,
    "Noodles & Pasta": Pasta,
    "Vegetables": Vegetables,
  };

  //.........................................
  static List<ReviewItem> exclusiveOffer = [
    ReviewItem(
      item: GroceryItem(
        id: '1',
        name: 'Organic Bananas',
        image: 'assets/images/products/banana.png',
        weight: 7,
        price: 4.99,
      ),
      productDetails: 'Fresh organic bananas from the farm.',
      nutritions: 'Rich in potassium and fiber.',
      rating: 4.8,
    ),
    ReviewItem(
      item: GroceryItem(
        id: '2',
        name: 'Red Apple',
        image: 'assets/images/products/apple.png',
        weight: 1,
        price: 4.99,
      ),
      productDetails: 'Sweet and juicy red apples.',
      nutritions: 'High in vitamins and antioxidants.',
      rating: 4.7,
    ),
    ReviewItem(
      item: GroceryItem(
        id: '3',
        name: 'Egg Chicken Red',
        image: 'assets/images/products/redEgg.png',
        weight: 4,
        price: 1.99,
      ),
      productDetails: 'Farm fresh red chicken eggs.',
      nutritions: 'Good source of protein.',
      rating: 4.5,
    ),
    ReviewItem(
      item: GroceryItem(
        id: '4',
        name: 'Egg Chicken White',
        image: 'assets/images/products/whiteEgg.png',
        weight: 6,
        price: 1.50,
      ),
      productDetails: 'High-quality white chicken eggs.',
      nutritions: 'Protein-rich with essential nutrients.',
      rating: 4.6,
    ),
    ReviewItem(
      item: GroceryItem(
        id: '5',
        name: 'Egg Pasta',
        image: 'assets/images/products/eggPasta.png',
        weight: 0.3,
        price: 15.99,
      ),
      productDetails: 'Delicious egg pasta perfect for quick meals.',
      nutritions: 'High in carbs and proteins.',
      rating: 4.2,
    ),
    ReviewItem(
      item: GroceryItem(
        id: '6',
        name: 'Egg Noodles',
        image: 'assets/images/products/eggNoodles.png',
        weight: 0.21,
        price: 15.99,
      ),
      productDetails: 'Tasty egg noodles, easy to prepare.',
      nutritions: 'Contains carbs and essential minerals.',
      rating: 4.0,
    ),
  ];

  static List<ReviewItem> groceries = [
    ReviewItem(
      item: GroceryItem(
        id: '9',
        name: 'Beef Bone',
        image: 'assets/images/products/redMeat.png',
        weight: 1,
        price: 4.99,
      ),
      productDetails: 'Fresh beef bone, ideal for soups.',
      nutritions: 'Rich in collagen and minerals.',
      rating: 4.5,
    ),
    ReviewItem(
      item: GroceryItem(
        id: '10',
        name: 'Broiler Chicken',
        image: 'assets/images/products/chicken.png',
        weight: 1,
        price: 4.99,
      ),
      productDetails: 'Tender broiler chicken for cooking.',
      nutritions: 'High-quality protein source.',
      rating: 4.6,
    ),
  ];

  // Best Selling (other items)
  static List<ReviewItem> bestSelling = [
    ReviewItem(
      item: GroceryItem(
        id: '8',
        name: 'Bell Pepper Red',
        image: 'assets/images/products/pepper.png',
        weight: 1,
        price: 4.99,
      ),
      productDetails: 'Chilling pepper red',
      nutritions: 'Contains carbs and essential minerals.',
      rating: 4.0,
    ),
    ReviewItem(
      item: GroceryItem(
        id: '7',
        name: 'Ginger',
        image: 'assets/images/products/ginger.png',
        weight: 0.25,
        price: 2.99,
      ),
      productDetails: 'Tasty egg noodles, easy to prepare.',
      nutritions: 'Contains carbs and essential minerals.',
      rating: 4.0,
    ),
  ];
  static List<ReviewItem> miniGroceries = [
    ReviewItem(
      item: GroceryItem(
        id: '11',
        name: 'Pulses',
        image: 'assets/images/products/pulse.png',
        weight: 1,
        price: 4.99,
      ),
      productDetails: 'Tender pulses for cooking.',
      nutritions: 'High-quality protein source.',
      rating: 4.6,
    ),
    ReviewItem(
      item: GroceryItem(
        id: '12',
        name: 'Rice Cake',
        image: 'assets/images/products/cake.png',
        weight: 1,
        price: 4.99,
      ),
      productDetails: 'Seasoned Rice cakes.',
      nutritions: 'High-quality carbohydrate source.',
      rating: 4.6,
    ),
  ];
  static List<ReviewItem> allData = [
    ...exclusiveOffer,
    ...groceries,
    ...bestSelling,
    ...miniGroceries,
  ];

  static List<ReviewItem> getListByName(String name) {
    switch (name) {
      case 'Eggs':
        return Eggs;
      case 'Meat':
        return Dairy;
      case 'Fruits':
        return Fruits;
      case 'Noodles & Pasta':
        return Pasta;
      case 'Fastfood':
        return Fastfood;
      case 'Vegetables':
        return Vegetables;
      default:
        return [];
    }
  }
}
