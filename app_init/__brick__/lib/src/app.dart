import 'package:flutter/material.dart';
{{#locks_screen_to_portrait}}
import 'package:flutter/services.dart';
{{/locks_screen_to_portrait}}
import 'package:{{ project_name.snakeCase() }}/src/core/constants/settings.dart';
{{#uses_db}}
{{^uses_router}}
import 'package:{{ project_name.snakeCase() }}/src/features/shared/presentation/widgets/debugger_wrapper/debugger_wrapper.widget.dart';
{{/uses_router}}
{{/uses_db}}
{{#uses_router}}
import 'package:{{ project_name.snakeCase() }}/src/routing/router.dart';
{{/uses_router}}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    // Initialize any configs here if required
    // These are typically store in core/constants/
    // SizeConfig.init(context);

    {{#locks_screen_to_portrait}}
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    {{/locks_screen_to_portrait}}

    final lightTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: kSeedColor,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
    );

    final darkTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: kSeedColor,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    );

    final themeMode = ThemeMode.system;

    {{#uses_router}}
    return MaterialApp.router(
      title: kAppName,
      routerConfig: router,
      themeMode: themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
    {{/uses_router}}

    {{^uses_router}}
    return MaterialApp(
      title: kAppName,
      themeMode: themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      {{#uses_db}}
      home: DebuggerWrapper(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
          ),
          body: const Center(
            child: Text("Welcome Home"),
          ),
        ),
      ),
      {{/uses_db}}
      {{^uses_db}}
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: const Center(
          child: Text("Welcome Home"),
        ),
      ),
      {{/uses_db}}
    );
    {{/uses_router}}
  }
}
