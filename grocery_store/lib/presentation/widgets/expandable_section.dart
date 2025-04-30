import 'package:flutter/material.dart';
import '../../theme/exported_theme_file.dart';

class ExpandableSection extends StatefulWidget {
  final String title;
  final String content;

  const ExpandableSection({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => setState(() => expanded = !expanded),
            child: Row(
              children: [
                Text(widget.title, style: textTheme.bodyMedium),
                const Spacer(),
                Icon(expanded ? Icons.expand_less : Icons.expand_more),
              ],
            ),
          ),
          if (expanded)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                widget.content,
                style: textTheme.bodySmall,
              ),
            ),
        ],
      ),
    );
  }
}
