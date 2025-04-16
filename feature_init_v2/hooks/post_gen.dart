import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final installationProgress =
      context.logger.progress("Installing packages for model generation...");

  final packages = [
    'freezed_annotation',
    'dev:freezed',
    'json_annotation',
    'dev:build_runner',
    'dev:json_serializable'
  ];

  await Process.run(
    'flutter',
    ['pub', 'add', ...packages],
    runInShell: true,
  );

  installationProgress.complete();
}
