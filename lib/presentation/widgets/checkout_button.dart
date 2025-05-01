import 'package:provider/provider.dart';
import '../../theme/exported_theme_file.dart';
import '../../data/models/exported_model_files.dart';
import '../../domain/providers/cart_provider.dart';
import '../screens/product_details_screen.dart';
import 'exported_widget_files.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    if (cart.itemCount == 0) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) =>
              CheckoutBottomSheet(totalPrice: cart.totalPrice),
        );
        print("tapped");
      },
      child: Container(
        margin: const EdgeInsets.all(16),
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.primaryGreen,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            const Expanded(
              child: Center(
                child: Text(
                  'Go to Checkout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        16, // or Theme.of(context).textTheme.bodyMedium?.fontSize
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.badgeGreen,
                // borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '\$${cart.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
