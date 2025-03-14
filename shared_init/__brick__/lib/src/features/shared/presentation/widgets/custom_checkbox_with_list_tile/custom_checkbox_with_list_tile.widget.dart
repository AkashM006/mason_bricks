import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/src/core/constants/app_offsets.dart';

class CustomCheckboxWithListTileWidget extends StatelessWidget {
  final bool checked;
  final void Function(bool?) onChanged;
  final String title;

  const CustomCheckboxWithListTileWidget({
    super.key,
    required this.checked,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: AppOffsets.cardBorderRadius),
      onTap: () => onChanged(!checked),
      contentPadding: EdgeInsets.only(left: 0),
      title: Text(title),
      leading: Checkbox(value: checked, onChanged: onChanged),
    );
  }
}
