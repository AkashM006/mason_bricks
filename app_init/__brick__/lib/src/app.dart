import 'package:flutter/material.dart';
{{#locks_screen_to_portrait}}
import 'package:flutter/services.dart';
{{/locks_screen_to_portrait}}
import 'package:{{ project_name.snakeCase() }}/src/core/constants/settings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    AppOffsets.init(context);

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
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kSeedColor,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kSeedColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
    );
    {{/uses_router}}

    {{^uses_router}}
    return MaterialApp(
      title: kAppName,
      themeMode: themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: const Center(
          child: Text("Welcome Home"),
        ),
      ),
    );
    {{/uses_router}}
  }
}
