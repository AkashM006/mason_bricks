import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final currentDirectory = Directory.current;
  final usesDb = context.vars['uses_db'] as bool;

  final loader = context.logger.progress("Generating code for your feature");

  await Process.run(
    'dart',
    ['format', currentDirectory.path],
    runInShell: true,
  );

  loader.complete();

  if (usesDb)
    context.logger.info(
      "Include your generated schema in db and then generate code using build_runner",
    );
}
