import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final currentDirectory = Directory.current;

  final installationProgress =
      context.logger.progress("Installing packages used by drift...");

  final packages = [
    'drift',
    'drift_flutter',
    'dev:drift_dev',
    'dev:build_runner',
    'dev:drift_db_viewer'
  ];

  await Process.run(
    'flutter',
    ['pub', 'add', ...packages],
    runInShell: true,
  );

  installationProgress.complete();

  final formattingProgress =
      context.logger.progress("Formatting generated code...");

  await Process.run(
    'dart',
    ['format', currentDirectory.path],
    runInShell: true,
  );

  formattingProgress.complete();
}
