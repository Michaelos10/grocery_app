import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/exported_theme_file.dart';
import '../../data/models/exported_model_files.dart';
import '../../domain/providers/cart_provider.dart';
import '../screens/product_details_screen.dart';
import 'exported_widget_files.dart';

class ExploreItemGrid extends StatelessWidget {
  final List<ReviewItem> items;

  const ExploreItemGrid({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // Let parent scroll
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75, // Adjust as needed
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final groceryItem = items[index].item;

          return GroceryItemCard(
            item: groceryItem,
            onAdd: () {
              final cart = Provider.of<CartProvider>(context, listen: false);
              cart.addItem(groceryItem);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${groceryItem.name} added to cart'),
                  duration: const Duration(seconds: 1),
                  // behavior: SnackBarBehavior.floating,
                ),
              );
            },
            onCardTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    reviewItem: items[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
