import '../../data/models/exported_model_files.dart';
import '../../theme/exported_theme_file.dart';
import '../screens/order_completed.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Optional if using SVG icons

class CheckoutBottomSheet extends StatelessWidget {
  final double totalPrice;

  const CheckoutBottomSheet({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Checkout",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, color: AppColors.primaryDark),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // List Tiles
          _buildRow(context, "Delivery", "Select Method", Icons.chevron_right),
          _buildRow(context, "Payment", "", Icons.payment),
          _buildRow(
              context, "Promo Code", "Pick discount", Icons.chevron_right),
          _buildRow(
            context,
            "Total Cost",
            "\$${totalPrice.toStringAsFixed(2)}",
            Icons.chevron_right,
            boldValue: true,
          ),

          const SizedBox(height: 16),

          // Terms and Conditions
          const Text.rich(
            TextSpan(
              text: "By placing an order you agree to our\n",
              children: [
                TextSpan(
                  text: "Terms And Conditions",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                )
              ],
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textGrey,
            ),
          ),

          const SizedBox(height: 16),

          // Place Order Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CompleteOrder()),
                );
                // Handle order placement
              },
              child: Text(
                "Place Order",
                style: theme.textTheme.labelLarge?.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
    BuildContext context,
    String label,
    String value,
    IconData icon, {
    bool boldValue = false,
  }) {
    final theme = Theme.of(context);
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: Text(
        label,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: AppColors.textDark,
          fontSize: 14,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: boldValue ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(width: 4),
          Icon(icon, size: 18, color: AppColors.textGrey),
        ],
      ),
    );
  }
}
