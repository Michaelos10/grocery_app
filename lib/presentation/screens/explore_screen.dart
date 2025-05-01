import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/providers/grocery_provider.dart';
import '../../presentation/widgets/search_bar.dart';
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
