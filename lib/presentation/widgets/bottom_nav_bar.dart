import '../../theme/exported_theme_file.dart';
import '../../data/models/exported_model_files.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  BottomNavBar({required this.currentIndex, required this.onTabSelected});

  final List<NavItem> _navItems = [
    NavItem('Shop', 'assets/icons/onShop.png', 'assets/icons/offShop.png',
        isIcon: false),
    NavItem(
        'Explore', 'assets/icons/onExplore.png', 'assets/icons/offExplore.png',
        isIcon: false),
    NavItem('Cart', 'assets/icons/onCart.png', 'assets/icons/offCart.png',
        isIcon: false),
    NavItem('Favourite', Icons.favorite, Icons.favorite_border, isIcon: true),
    NavItem('Account', Icons.person, Icons.person_outline, isIcon: true),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: Dimensions.bottomBarHeight,
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_navItems.length, (index) {
          final item = _navItems[index];
          final isSelected = index == currentIndex;

          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                item.isIcon
                    ? Icon(
                        isSelected
                            ? item.onIcon as IconData
                            : item.offIcon as IconData,
                        size: 24,
                        color: isSelected
                            ? AppColors.primaryGreen
                            : AppColors.primaryDark,
                      )
                    : Image.asset(
                        isSelected
                            ? item.onIcon as String
                            : item.offIcon as String,
                        width: 24,
                        height: 24,
                        color: isSelected
                            ? AppColors.primaryGreen
                            : AppColors.primaryDark,
                      ),
                const SizedBox(height: 4),
                Text(
                  item.label,
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected
                        ? AppColors.primaryGreen
                        : AppColors.primaryDark,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
