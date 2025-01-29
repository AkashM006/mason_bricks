import 'package:flutter/material.dart';
{{#uses_router}}
import 'package:go_router/go_router.dart';
{{/uses_router}}

class ConfirmDialogWidget extends StatelessWidget {
  const ConfirmDialogWidget({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    void pop(result) {
      {{#uses_router}}
      context.pop(result);
      {{/uses_router}}
      {{^uses_router}}
      Navigator.pop(context, false);
      {{/uses_router}}
    }
    
    void onCancel() {
      pop(false);
    }

    void onProceed() {
      pop(true);
    }

    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(onPressed: onCancel, child: const Text("Cancel")),
        TextButton(onPressed: onProceed, child: const Text("Proceed")),
      ],
    );
  }
}
