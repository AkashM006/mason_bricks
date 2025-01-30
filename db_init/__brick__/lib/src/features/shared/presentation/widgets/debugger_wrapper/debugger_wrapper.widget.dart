{{#uses_router}}
import 'package:{{ project_name.snakeCase() }}/src/routing/router.dart';
import 'package:go_router/go_router.dart';
{{/uses_router}}
{{^uses_router}}
import 'package:{{ project_name.snakeCase() }}/src/features/shared/presentation/drift_debug.screen.dart';
{{/uses_router}}
import 'package:flutter/material.dart';

class DebuggerWrapper extends StatelessWidget {
  final Widget child;

  const DebuggerWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    void onDebugDb() {
      {{#uses_router}}
      context.push(PAGES.driftDebug.path);
      {{/uses_router}}
      {{^uses_router}}
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DriftDebugScreen(),
        ),
      );
      {{/uses_router}}
    }

    return Stack(
      children: [
        child,
        Positioned(
          bottom: 16,
          left: 16,
          child: FloatingActionButton(
            heroTag: 'Debug fab',
            backgroundColor: Colors.red,
            onPressed: onDebugDb,
            child: const Icon(Icons.bug_report),
          ),
        ),
      ],
    );
  }
}
