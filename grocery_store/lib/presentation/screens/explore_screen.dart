import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/providers/cart_provider.dart';
import '../../data/models/cart_item.dart';
import '../../data/models/grocery_item.dart';
import '../../domain/providers/grocery_provider.dart';
import '../../presentation/widgets/grocery_item_tile.dart';
import '../../presentation/widgets/search_bar.dart';
import '../../data/models/review_item.dart';
import '../../data/data_sources/mock_data.dart';
import '../../theme/exported_theme_file.dart';
import '../widgets/exported_widget_files.dart';
import 'product_details_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

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
              const SizedBox(height: 10),
              SearchBarTile(
                isFilter: true,
                onChanged: (value) {
                  print('Search: $value');
                },
                onFilterTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const FilterBottomSheet(),
                  );
                },
              ),
              Column(
                children: [
                  ExploreItemGrid(items: provider.filteredItems),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
