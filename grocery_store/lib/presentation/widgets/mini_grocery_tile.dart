import '../../theme/exported_theme_file.dart';
import '../../data/models/exported_model_files.dart';

class MiniGroceryTile extends StatelessWidget {
  final ReviewItem item;
  final int index;
  final double height;
  final double width;

  const MiniGroceryTile({
    required this.item,
    required this.index,
    this.height = 80,
    this.width = 160,
    Key? key,
  }) : super(key: key);

  // Generate different colors based on index
  Color _getColorFromIndex(int index) {
    final colors = [
      Color(0xFF8A44C)!,
      Colors.green[200]!,
      Color(0xFF53B175)!,
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Container(
        decoration: BoxDecoration(
          color: _getColorFromIndex(index),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.asset(
              item.item.image,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                item.item.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
