import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/src/core/constants/app_offsets.dart';

class BodyContainerWidget extends StatelessWidget {
  const BodyContainerWidget({
    super.key,
    required this.child,
    this.applyPadding = true,
  });

  final Widget child;
  final bool applyPadding;

  @override
  Widget build(BuildContext context) {
    final newChild =
        applyPadding
            ? Padding(padding: AppOffsets.bodyPadding, child: child)
            : child;

    return ConstrainedBox(
      constraints: AppOffsets.bodyWidthConstraint,
      child: newChild,
    );
  }
}
