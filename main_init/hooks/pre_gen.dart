import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final usesRouter = context.vars['uses_router'] as bool;
  final usesRiverpod = context.vars['uses_riverpod'] as bool;
  final usesDb = context.vars['uses_db'] as bool;
  final usesV2 = context.vars['uses_v2'] as bool;
  final locksScreenToPortrait =
      context.vars['locks_screen_to_portrait'] as bool;
  final projectName = context.vars['project_name'] as String;
  final currentDirectory = Directory.current;

  final List<Map<String, dynamic>> brickDetails = [
    {
      'name': 'core',
      'path': usesV2 ? 'core_init_v2' : 'core_init',
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
    'locks_screen_to_portrait': locksScreenToPortrait,
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

  final mainFile = File('lib/main.dart');
  if (mainFile.existsSync()) {
    mainFile.deleteSync();
  }
}
