import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final projectName = context.vars['project_name'];

  final coreProgress = context.logger.progress("Making core_init brick....");
  final currentDirectory = Directory.current;

  final generator = await MasonGenerator.fromBrick(
    Brick.git(
      GitPath("https://github.com/AkashM006/mason_bricks", path: 'core_init'),
    ),
  );

  await generator.generate(
    DirectoryGeneratorTarget(currentDirectory),
    vars: {
      'project_name': projectName,
    },
  );

  await generator.hooks.postGen();

  coreProgress.complete();
}
