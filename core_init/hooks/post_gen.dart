import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  final progress = context.logger.progress('Installing required packages...');

  Process.run('flutter', ['pub', 'add', 'intl', 'uuid'], runInShell: true);

  progress.complete();
}
