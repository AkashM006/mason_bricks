import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final projectName = context.vars['project_name'] as String;
  final currentDirectory = Directory.current;

  // Initializing core_init brick since this brick needs it
  final coreProgress =
      context.logger.progress("Making core_init with hooks....");

  final generator = await MasonGenerator.fromBrick(
    Brick.git(
      GitPath('https://github.com/AkashM006/mason_bricks', path: 'core_init'),
    ),
  );

  await generator.generate(
    DirectoryGeneratorTarget(currentDirectory),
    vars: {'project_name': projectName},
    fileConflictResolution: FileConflictResolution.overwrite,
  );

  await generator.hooks.postGen();

  coreProgress.complete();
}
