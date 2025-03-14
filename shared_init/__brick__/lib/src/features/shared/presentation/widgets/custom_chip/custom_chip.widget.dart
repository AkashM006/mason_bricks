import 'package:flutter/material.dart';

class CustomChipWidget extends StatelessWidget {
  final String label;
  final void Function() onClear;
  final bool isHorizontal;

  const CustomChipWidget({
    super.key,
    required this.label,
    required this.onClear,
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isHorizontal) {
      return Container(
        margin: const EdgeInsets.only(right: 8),
        child: Chip(
          label: Text(label),
          deleteIcon: const Icon(Icons.close),
          onDeleted: onClear,
        ),
      );
    }

    return Chip(
      label: Text(label),
      deleteIcon: const Icon(Icons.close),
      onDeleted: onClear,
    );
  }
}
