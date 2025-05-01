import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/exported_theme_file.dart';
import '../../data/models/exported_model_files.dart';
import '../../domain/providers/cart_provider.dart';

class CartItemTile extends StatelessWidget {
  final GroceryItem item;
  final int quantity;

  const CartItemTile({
    required this.item,
    required this.quantity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                item.image,
                width: 71,
                height: 65,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Product Info and controls
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + Remove Button
                Text(
                  item.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 4),
                Text(
                  '${item.weight}kg, Price',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 8),

                // Quantity stepper and price
                Row(
                  children: [
                    // Decrement button
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.textGrey.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.remove, size: 16),
                        onPressed: () => cart.removeItem(item),
                        padding: EdgeInsets.zero,
                        constraints:
                            const BoxConstraints(minWidth: 32, minHeight: 32),
                      ),
                    ),
                    const SizedBox(width: 8),

                    Text(
                      '$quantity',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 8),

                    // Increment button
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.textGrey.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add,
                            size: 16, color: AppColors.primaryGreen),
                        onPressed: () => cart.addItem(item),
                        padding: EdgeInsets.zero,
                        constraints:
                            const BoxConstraints(minWidth: 32, minHeight: 32),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Price
          Column(
            children: [
              GestureDetector(
                onTap: () => cart.removeAllItemsByName(item.name),
                child: const Icon(Icons.close,
                    size: 20, color: AppColors.textGrey),
              ),
              const SizedBox(height: 20),
              Text(
                '\$${(item.price * quantity).toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
