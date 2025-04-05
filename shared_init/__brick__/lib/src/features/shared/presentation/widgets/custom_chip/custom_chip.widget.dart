import 'package:flutter/material.dart';
import 'package:{{ project_name.snakeCase() }}/src/core/constants/extensions.dart';

class CustomChipWidget extends StatelessWidget {
  final String label;
  final void Function()? onClear;
  final bool isHorizontal;

  final bool custom;

  const CustomChipWidget({
    super.key,
    required this.label,
    required this.onClear,
    this.isHorizontal = false,
    this.custom = false,
  });

  const CustomChipWidget.small({super.key, required this.label})
    : onClear = null,
      custom = true,
      isHorizontal = false;

  @override
  Widget build(BuildContext context) {
    if (custom) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: context.colorScheme.outlineVariant,
          ),
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(label, style: context.textTheme.bodySmall),
      );
    }

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
