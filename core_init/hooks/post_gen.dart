import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progress = context.logger.progress('Installing required packages...');

  await Process.run(
    'flutter',
    ['pub', 'add', 'intl', 'uuid'],
    runInShell: true,
  );

  progress.complete();

  final formattingProgress =
      context.logger.progress("Formatting generated code...");

  final directory = Directory.current;
  await Process.run('dart', ['format', directory.path], runInShell: true);

  formattingProgress.complete();
}
