import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final usesRouter = context.vars['uses_router'] as bool;
  final usesRiverpod = context.vars['uses_riverpod'] as bool;
  final usesDb = context.vars['uses_db'] as bool;
  final projectName = context.vars['project_name'] as String;
  final currentDirectory = Directory.current;

  final List<Map<String, dynamic>> brickDetails = [
    {
      'name': 'core',
      'path': 'core_init',
    },
    {
      'name': 'shared',
      'path': 'shared_init',
    },
    {
      'name': 'riverpod',
      'path': 'riverpod_init',
      'ignore': !usesRiverpod && !usesDb,
    },
    {
      'name': 'db',
      'path': 'db_init',
      'ignore': !usesDb,
    },
    {
      'name': 'router',
      'path': 'router_init',
      'ignore': !usesRouter,
    },
    {
      'name': 'app',
      'path': 'app_init',
    }
  ];

  final vars = {
    'project_name': projectName,
    'uses_db': usesDb,
    'uses_riverpod': usesRiverpod,
    'uses_router': usesRouter,
  };

  for (var brick in brickDetails) {
    if (brick['ignore'] != null && brick['ignore']) continue;

    final progress =
        context.logger.progress("Making ${brick['name']} brick...");

    final generator = await MasonGenerator.fromBrick(
      Brick.git(
        GitPath(
          "https://github.com/AkashM006/mason_bricks",
          path: brick['path'],
          ref: "features/app_init",
        ),
      ),
    );

    await generator.hooks.postGen(vars: vars);

    await generator.generate(
      DirectoryGeneratorTarget(currentDirectory),
      vars: vars,
      fileConflictResolution: FileConflictResolution.prompt,
    );

    progress.complete();
  }
}
