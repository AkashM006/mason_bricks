import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    this.onTap,
    this.child,
  });

  final void Function()? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        // Change offsets if required
        // borderRadius: AppOffsets.cardBorderRadius,
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: cardBorderRadius,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
