import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/providers/cart_provider.dart';
import '../../domain/providers/grocery_provider.dart';
import '../../data/models/cart_item.dart';
import '../../data/models/grocery_item.dart';
import '../../presentation/widgets/grocery_item_tile.dart';
import '../../presentation/widgets/search_bar.dart';
import '../../data/models/review_item.dart';
import '../../data/data_sources/mock_data.dart';
import '../../theme/exported_theme_file.dart';
import '../widgets/exported_widget_files.dart';
import 'product_details_screen.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GroceryProvider>(context);
    return Container(
      color: Colors.white, // Background color
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/home/home_carrot.png',
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 19,
                    color: AppColors.locationIcon,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Dhaka, Banassre',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textDark,
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SearchBarTile(
                isFilter: false,
                onChanged: (value) {
                  print('Search: $value');
                },
                onFilterTap: () {
                  print('Filter tapped');
                },
              ),
              const SizedBox(height: 10),
              Image.asset(
                'assets/images/home/home_banner.png',
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  // Exclusive Offer Section
                  SectionHeader(
                    title: 'Exclusive Offer',
                    onActionTap: () {
                      // Navigate to "See all" screen or handle tap
                    },
                  ),
                  const SizedBox(height: 10),
                  GroceryItemGrid(
                    items: ProductData.exclusiveOffer,
                  ),

                  // Best Selling Section
                  const SizedBox(height: 20),
                  SectionHeader(
                    title: 'Best Selling',
                    onActionTap: () {
                      // Navigate to "See all" screen or handle tap
                    },
                  ),
                  const SizedBox(height: 10),
                  GroceryItemGrid(
                    items: ProductData.bestSelling,
                  ),

                  //Groceries section
                  const SizedBox(height: 20),
                  SectionHeader(
                    title: 'Groceries',
                    onActionTap: () {
                      // Navigate to "See all" screen or handle tap
                    },
                  ),

                  const SizedBox(height: 10),
                  MiniGroceryGrid(items: ProductData.miniGroceries),

                  const SizedBox(height: 10),

                  GroceryItemGrid(
                    items: ProductData.groceries,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
