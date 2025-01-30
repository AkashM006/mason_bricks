import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final riverpodInitProgress = context.logger.progress("Making riverpod...");
  final currentDirectory = Directory.current;
  final projectName = context.vars['project_name'] as String;

  final riverpodGenerator = await MasonGenerator.fromBrick(
    Brick.git(
      GitPath(
        'https://github.com/AkashM006/mason_bricks',
        path: 'riverpod_init',
      ),
    ),
  );

  await riverpodGenerator.hooks.preGen();

  await riverpodGenerator.generate(
    DirectoryGeneratorTarget(currentDirectory),
    vars: {'project_name': projectName},
  );

  await riverpodGenerator.hooks.postGen();

  riverpodInitProgress.complete();
}
