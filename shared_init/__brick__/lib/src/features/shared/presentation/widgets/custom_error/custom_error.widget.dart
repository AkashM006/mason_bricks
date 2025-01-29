import 'package:{{ project_name.snakeCase() }}/src/core/constants/size.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final errorColor = Theme.of(context).colorScheme.error;

    return ConstrainedBox(
      // Change constraints if required
      // constraints: AppOffsets.messageWidthConstaint,
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_rounded,
            size: SizeConfig.safeBlockVertical * 5,
            color: errorColor,
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 2,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: errorColor),
          ),
        ],
      ),
    );
  }
}
