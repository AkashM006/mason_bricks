import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  const packages = [
    'flutter_riverpod',
    'riverpod_annotation',
    'dev:riverpod_generator',
    'dev:build_runner',
    'dev:custom_lint',
    'dev:riverpod_lint',
  ];

  final progress = context.logger.progress('Installing riverpod packages...');

  await Process.run('flutter', ['pub', 'add', ...packages], runInShell: true);

  progress.complete();
}
