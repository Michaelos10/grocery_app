import 'package:flutter/material.dart';
import '../../theme/exported_theme_file.dart';

class CompleteOrder extends StatelessWidget {
  const CompleteOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/backgroundImage.png',
            fit: BoxFit.cover,
          ),

          // Foreground content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Spacer(),

                // Center image (like a checkmark)
                Image.asset(
                  'assets/images/success.png',
                  height: 120,
                ),

                const SizedBox(height: 24),

                // Bold Title
                Text(
                  'Your Order has been accepted',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 12),

                // Light subtitle
                Text(
                  'Your order has been placed and its on its way to being processed.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textDark,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),

                // Existing buttons section now becomes:

                const Spacer(),

                // Track Now
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // Handle tracking
                    },
                    child: Text(
                      'Track Now',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Home Now
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      // side: const BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to home screen
                    },
                    child: Text(
                      'Back Home',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          )
        ],
      ),
    );
  }
}
