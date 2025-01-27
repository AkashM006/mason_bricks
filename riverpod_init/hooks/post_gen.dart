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

  final List<String> commands = ['pub', 'add'];

  final progress = context.logger.progress('Installing riverpod packages...');

  for (var package in packages) {
    commands.add(package);
  }
  await Process.run('flutter', commands, runInShell: true);

  progress.complete();
}
