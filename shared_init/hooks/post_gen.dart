import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final formattingProgress =
      context.logger.progress("Formatting generated code...");

  final directory = Directory.current;
  await Process.run('dart', ['format', directory.path], runInShell: true);

  formattingProgress.complete();
}
