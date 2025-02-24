import 'package:flutter/widgets.dart';
import 'package:{{project_name.snakeCase()}}/src/core/constants/extensions.dart';
import 'package:{{project_name.snakeCase()}}/src/features/shared/presentation/widgets/full_screen_msg_container/full_screen_msg_container.widget.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({
    super.key,
    required this.titleIcon,
    required this.title,
    required this.subtitle,
    this.actions,
  });

  final String titleIcon;
  final String title;
  final String subtitle;
  final Widget? actions;

  @override
  Widget build(BuildContext context) {
    return FullScreenMsgContainerWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titleIcon,
            textAlign: TextAlign.center,
            style: context.textTheme.displayLarge,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
          ),
          if (actions != null) actions!,
        ],
      ),
    );
  }
}
