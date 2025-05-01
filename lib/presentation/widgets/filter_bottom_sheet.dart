import '../../data/models/exported_model_files.dart';
import '../../theme/exported_theme_file.dart';
import '../../data/data_sources/mock_data.dart';
import '../../domain/providers/grocery_provider.dart';
import '../../domain/providers/filter_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Optional if using SVG icons

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final Map<String, bool> categories = {
    "Eggs": false,
    "Dairy": false,
    "Noodles & Pasta": false,
    "Fruits": false,
    "Fast Food": false,
    "Vegetables": false,
  };

  final Map<String, bool> brands = {
    "Individual Collection": false,
    "Cocola": false,
    "Ifad": false,
    "Kazi Farmas": false,
  };

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context);

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: AppColors.primaryDark),
                ),
                const SizedBox(width: 12),
                const Text(
                  "Filters",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildSection("Categories", filterProvider.categories,
                filterProvider.toggleCategory),
            const SizedBox(height: 16),
            _buildSection(
                "Brand", filterProvider.brands, filterProvider.toggleBrand),
            const SizedBox(height: 24),
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
                  final selectedCategories = filterProvider.categories.entries
                      .where((entry) => entry.value)
                      .map((entry) => entry.key)
                      .toList();

                  final provider =
                      Provider.of<GroceryProvider>(context, listen: false);

                  if (selectedCategories.isNotEmpty) {
                    provider.setCategories(selectedCategories);
                  } else {
                    provider.setCategories([]);
                  }

                  Navigator.pop(context);
                },
                child: const Text(
                  "Apply Filter",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      String title, Map<String, bool> items, Function(String, bool) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDark,
          ),
        ),
        const SizedBox(height: 8),
        ...items.entries.map((entry) {
          final isChecked = entry.value;
          return Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: isChecked,
                  onChanged: (value) => onChanged(entry.key, value!),
                  activeColor: AppColors.primaryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: const BorderSide(color: AppColors.textGrey),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  entry.key,
                  style: TextStyle(
                    fontSize: 14,
                    color:
                        isChecked ? AppColors.primaryGreen : AppColors.textDark,
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ],
    );
  }
}
