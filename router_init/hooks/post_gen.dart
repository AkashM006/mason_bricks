import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final routerProgress = context.logger.progress("Installing go_router");

  await Process.run('flutter', ['pub', 'add', 'go_router']);

  routerProgress.complete();
}
