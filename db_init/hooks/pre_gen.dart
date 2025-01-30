import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final riverpodInitProgress = context.logger.progress("Making riverpod...");
  final currentDirectory = Directory.current;
  final projectName = context.vars['project_name'];

  final riverpodGenerator = await MasonGenerator.fromBrick(
    Brick.git(
      GitPath(
        'https://github.com/AkashM006/mason_bricks',
        path: 'riverpod_init',
      ),
    ),
  );

  final vars = {'project_name': projectName};

  await riverpodGenerator.hooks.preGen(vars: vars);

  await riverpodGenerator.generate(
    DirectoryGeneratorTarget(currentDirectory),
    vars: vars,
  );

  await riverpodGenerator.hooks.postGen(vars: vars);

  riverpodInitProgress.complete();
}
