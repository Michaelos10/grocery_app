import 'package:flutter/material.dart';
import '../../theme/exported_theme_file.dart';
import '../widgets/exported_widget_files.dart';
import '../../data/models/review_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/providers/cart_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final ReviewItem reviewItem;

  const ProductDetailScreen({
    Key? key,
    required this.reviewItem,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final groceryItem = widget.reviewItem.item;
    final textTheme = Theme.of(context).textTheme;
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.upload : Icons.upload_outlined,
              color: isFavorite ? AppColors.primaryDark : AppColors.primaryDark,
            ),
            onPressed: () => setState(() => isFavorite = !isFavorite),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: Image.asset(
                groceryItem.image,
                height: 250,
                fit: BoxFit.contain,
              ),
            ),

            // Product Title and Basic Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        groceryItem.name,
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(), //SizedBox(width: 8),
                      IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color:
                              isFavorite ? Colors.red : AppColors.primaryDark,
                        ),
                        onPressed: () =>
                            setState(() => isFavorite = !isFavorite),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${groceryItem.weight}kg, Price',
                    style: textTheme.bodyLarge?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            // Price and Quantity Selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QuantitySelector(
                    quantity: quantity,
                    onAdd: () => setState(() => quantity++),
                    //cart.addItem(item),
                    onRemove: () => //cart.removeItem(item),
                        setState(() => quantity > 1 ? quantity-- : quantity),
                  ),
                  Text(
                    '\$${(groceryItem.price * quantity).toStringAsFixed(2)}',
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
            ),

            // Product Details Section
            _buildSection(
              title: 'Product Details',
              content: widget.reviewItem.productDetails,
            ),

            // Nutrition Facts Section
            _buildSection(
              title: 'Nutrition Facts',
              content: widget.reviewItem.nutritions,
              trailing: Text('${groceryItem.weight}kg,'),
            ),

            // Reviews Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Text('Reviews',
                      style: Theme.of(context).textTheme.bodyMedium),
                  const Spacer(),
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) => Icon(
                          index < widget.reviewItem.rating.floor()
                              ? Icons.star
                              : Icons.star_border,
                          color: AppColors.rating,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.reviewItem.rating}',
                        style: textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Add to Cart Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
    Widget? trailing,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              if (trailing != null) ...[
                const Spacer(),
                trailing,
              ],
            ],
          ),
          Text(
            content,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
