import '../../theme/exported_theme_file.dart';
import '../../theme/app_dimensions.dart';

class SearchBarTile extends StatefulWidget {
  final bool isFilter;
  final ValueChanged<String> onChanged;
  final VoidCallback? onFilterTap;

  const SearchBarTile({
    super.key,
    required this.isFilter,
    required this.onChanged,
    this.onFilterTap,
  });

  @override
  State<SearchBarTile> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarTile> {
  final TextEditingController _controller = TextEditingController();
  bool _showClear = false;
  double searchBarHeight = 52.0;

  void _handleTextChange(String value) {
    setState(() {
      _showClear = value.isNotEmpty;
    });
    widget.onChanged(value);
  }

  void _clearSearch() {
    _controller.clear();
    _handleTextChange('');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: searchBarHeight,
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Icon(Icons.search,
                    color: AppColors.searchIcon, size: Dimensions.searchIcon),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onChanged: _handleTextChange,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.color, // Use theme color
                        ),
                    cursorColor: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.color, // Match cursor color
                    decoration: InputDecoration(
                      hintText: 'Search Store',
                      hintStyle:
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .hintColor, // Optional: Style hint differently
                              ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if (_showClear)
                  GestureDetector(
                    onTap: _clearSearch,
                    child: Icon(Icons.close, color: AppColors.cancelIcon),
                  ),
              ],
            ),
          ),
        ),
        if (widget.isFilter) SizedBox(width: 2),
        if (widget.isFilter)
          GestureDetector(
            onTap: widget.onFilterTap,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.tune, color: AppColors.primaryDark),
            ),
          ),
      ],
    );
  }
}
