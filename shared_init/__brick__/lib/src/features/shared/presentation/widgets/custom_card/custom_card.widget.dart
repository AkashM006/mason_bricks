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
    // Change offsets if required
    // final cardBorderRadius = AppOffsets.cardBorderRadius;
    final cardBorderRadius = BorderRadius.circular(16);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: cardBorderRadius,
      ),
      child: InkWell(
        borderRadius: cardBorderRadius,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
