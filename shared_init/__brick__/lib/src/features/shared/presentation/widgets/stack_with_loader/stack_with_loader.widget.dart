import 'package:{{ project_name.snakeCase() }}/src/features/shared/presentation/widgets/loader/loader.widget.dart';
import 'package:flutter/material.dart';

class StackWithLoaderWidget extends StatelessWidget {
  const StackWithLoaderWidget({
    super.key,
    required this.isLoading,
    required this.children,
  });

  final bool isLoading;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      ...children,
      if (isLoading)
        Positioned.fill(
          child: Container(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.5),
            child: const Center(child: LoaderWidget()),
          ),
        ),
    ],
  );
}
