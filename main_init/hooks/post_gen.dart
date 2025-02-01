import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final currentDirectory = Directory.current;
  final usesRiverpod = context.vars['uses_riverpod'] as bool;
  final usesDb = context.vars['uses_db'] as bool;

  final formattingProgress =
      context.logger.progress("Formatting generated code...");

  await Process.run(
    'dart',
    ['format', currentDirectory.path],
    runInShell: true,
  );

  formattingProgress.complete();

  if (!usesRiverpod && !usesDb) return;

  final buildingProgress = context.logger.progress("Building code...");

  await Process.run('dart', ['run', 'build_runner', 'build']);

  buildingProgress.complete();
}
