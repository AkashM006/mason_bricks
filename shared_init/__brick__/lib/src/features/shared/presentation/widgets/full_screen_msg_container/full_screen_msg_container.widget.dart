import 'package:{{project_name.snakeCase()}}/src/core/constants/app_offsets.dart';
import 'package:flutter/material.dart';

class FullScreenMsgContainerWidget extends StatelessWidget {
  const FullScreenMsgContainerWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: AppOffsets.messageWidthConstaint,
        child: child,
      ),
    );
  }
}
