import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/exported_theme_file.dart';
import '../../data/models/exported_model_files.dart';
import '../../domain/providers/cart_provider.dart';
import '../screens/product_details_screen.dart';
import 'exported_widget_files.dart';

class GroceryItemGrid extends StatelessWidget {
  final List<ReviewItem> items;

  const GroceryItemGrid({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.containerHeight,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double cardWidth = (constraints.maxWidth / 2) - 12;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final groceryItem = items[index].item;

              return Container(
                width: cardWidth,
                margin: const EdgeInsets.only(right: 12),
                child: GroceryItemCard(
                  item: groceryItem,
                  onAdd: () {
                    final cart =
                        Provider.of<CartProvider>(context, listen: false);
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}
