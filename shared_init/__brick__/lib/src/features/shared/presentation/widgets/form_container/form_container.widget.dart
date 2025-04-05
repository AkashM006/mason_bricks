import 'package:flutter/material.dart';
import 'package:{{ project_name.snakeCase() }}/src/core/constants/app_offsets.dart';

class FormContainerWidget extends StatelessWidget {
  const FormContainerWidget({
    super.key,
    this.isScroll = true,
    required this.children,
  });

  final List<Widget> children;
  final bool isScroll;

  @override
  Widget build(BuildContext context) {
    final constrainedBox = ConstrainedBox(
      constraints: AppOffsets.formWidthConstraint,
      child: Column(children: children),
    );

    const padding = EdgeInsets.all(20);

    return isScroll
        ? SingleChildScrollView(padding: padding, child: constrainedBox)
        : Padding(padding: padding, child: constrainedBox);
  }
}
