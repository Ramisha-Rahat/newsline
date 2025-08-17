import 'package:flutter/material.dart';

class ExpandedTile extends StatefulWidget {
  final String label;
  final List<Widget> children;

  const ExpandedTile({
    super.key,
    required this.label,
    required this.children,
  });

  @override
  State<ExpandedTile> createState() => _ExpandedTileState();
}

class _ExpandedTileState extends State<ExpandedTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    return ExpansionTile(
      title: Row(
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      trailing: Icon(
        //_isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
        _isExpanded ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down,
        size: 24,
        color: colorScheme.onSurface,
      ),
      onExpansionChanged: (bool expanded) {
        setState(() {
          _isExpanded = expanded;
        });
      },
      children: widget.children,
    );
  }
}
