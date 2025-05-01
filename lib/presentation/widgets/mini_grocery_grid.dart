import 'package:flutter/material.dart';
import 'mini_grocery_tile.dart';
import '../../data/models/exported_model_files.dart';

class MiniGroceryGrid extends StatelessWidget {
  final List<ReviewItem> items;

  const MiniGroceryGrid({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: MiniGroceryTile(
              item: items[index],
              index: index,
            ),
          );
        },
      ),
    );
  }
}
