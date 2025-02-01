import 'package:{{ project_name.snakeCase() }}/src/app.dart';
import 'package:flutter/material.dart';
{{#uses_riverpod}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
{{/uses_riverpod}}

void main() {
  {{#uses_riverpod}}
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
  {{/uses_riverpod}}
  {{^uses_riverpod}}
  runApp(
    MyApp(),
  );
  {{/uses_riverpod}}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const App();
}
