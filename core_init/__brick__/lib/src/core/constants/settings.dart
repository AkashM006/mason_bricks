import 'package:flutter/material.dart';

const kAppName = '{{ project_name.pascalCase() }}';
const kSeedColor = Colors.blue;
{{#uses_db}}
const kHideDebugDb = false;
{{/uses_db}}
