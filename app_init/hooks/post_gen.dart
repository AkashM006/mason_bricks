import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final currentDirectory = Directory.current;

  final formattingProgress =
      context.logger.progress("Formatting generated code...");

  await Process.run(
    'dart',
    ['format', currentDirectory.path],
    runInShell: true,
  );

  formattingProgress.complete();
}
