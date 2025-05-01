import 'package:provider/provider.dart';
import '../../domain/providers/cart_provider.dart';
import '../../theme/exported_theme_file.dart';
import '../widgets/exported_widget_files.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: AppColors.white,
      child: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center, // Vertical center
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'My Cart',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                ],
              ),
            ),

            // Main Body
            Expanded(
              child: cart.itemCount == 0
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.shopping_cart_outlined,
                              size: 64, color: AppColors.textGrey),
                          const SizedBox(height: 16),
                          Text(
                            'Your cart is empty',
                            style: textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Add some delicious items!',
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (ctx, index) {
                        final item = cart.items.keys.elementAt(index);
                        final quantity = cart.items[item]!;
                        return CartItemTile(
                          item: item,
                          quantity: quantity,
                        );
                      },
                    ),
            ),

            // Bottom Summary
            CheckoutButton(),
          ],
        ),
      ),
    );
  }
}
