import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/src/core/constants/app_offsets.dart';

class BodyContainerWidget extends StatelessWidget {
  const BodyContainerWidget({
    super.key,
    required this.child,
    this.applyPadding = true,
  }) : isSliver = false;

  const BodyContainerWidget.sliver({
    super.key,
    required this.child,
    this.applyPadding = true,
  }) : isSliver = true;

  final Widget child;
  final bool applyPadding;
  final bool isSliver;

  @override
  Widget build(BuildContext context) {
    final newChild =
        applyPadding
            ? isSliver
                ? SliverPadding(padding: AppOffsets.bodyPadding, sliver: child)
                : Padding(padding: AppOffsets.bodyPadding, child: child)
            : child;

    if (isSliver) {
      return SliverConstrainedCrossAxis(
        maxExtent: AppOffsets.bodyWidthConstraint.maxWidth,
        sliver: newChild,
      );
    }

    return ConstrainedBox(
      constraints: AppOffsets.bodyWidthConstraint,
      child: newChild,
    );
  }
}
