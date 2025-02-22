import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/src/core/constants/app_offsets.dart';

class ListContainerWidget extends StatelessWidget {
  const ListContainerWidget({
    super.key,
    this.isScroll = true,
    required this.child,
  });

  final Widget child;
  final bool isScroll;

  @override
  Widget build(BuildContext context) {
    final constrainedBox = ConstrainedBox(
      constraints: AppOffsets.listWidthConstraint,
      child: child,
    );

    return constrainedBox;
  }
}
