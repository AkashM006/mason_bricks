import 'dart:async';

import 'package:{{ project_name.snakeCase() }}/src/core/constants/settings.dart';
import 'package:{{ project_name.snakeCase() }}/src/features/home/presentation/home.screen.dart';
import 'package:{{ project_name.snakeCase() }}/src/features/shared/presentation/not_found.screen.dart';
{{#uses_db}}
import 'package:{{ project_name.snakeCase() }}/src/features/shared/presentation/drift_debug.screen.dart';
import 'package:{{ project_name.snakeCase() }}/src/features/shared/presentation/widgets/debugger_wrapper/debugger_wrapper.widget.dart';
{{/uses_db}}
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum PAGES {
  {{#uses_db}}
  driftDebug,
  {{/uses_db}}
  notFound,
  home,
}

extension AppRoutesExtension on PAGES {
  String get path => switch (this) {
        {{#uses_db}}
        PAGES.driftDebug => '/drift-debug',
        {{/uses_db}}
        PAGES.notFound => '/*',
        PAGES.home => '/',
      };

  String get name => switch (this) {
        {{#uses_db}}
        PAGES.driftDebug => "Drift Debug",
        {{/uses_db}}
        PAGES.notFound => "Not Found",
        PAGES.home => "Home",
      };

  Widget Function(BuildContext context, GoRouterState routerState)
      get builder => switch (this) {
            {{#uses_db}}
            PAGES.driftDebug => (context, routerState) =>
                const DriftDebugScreen(),
            {{/uses_db}}
            PAGES.notFound => (context, routerState) => const NotFoundScreen(),
            PAGES.home => (context, routerState) => const HomeScreen(),
          };

  {{#uses_db}}
  FutureOr<String?> Function(BuildContext context, GoRouterState state)
      get redirect => switch (this) {
            PAGES.driftDebug => (context, routerState) {
                if (!kDebugMode && !kHideDebugDb) return PAGES.notFound.path;
                return null;
              },
            _ => (context, routerState) => null,
          };
  {{/uses_db}}
}

final List<RouteBase> routes = PAGES.values
    .map(
      (route) => GoRoute(
        path: route.path,
        name: route.name,
        {{#uses_db}}
        builder: (context, state) {
          final child = route.builder(context, state);
          if (kDebugMode &&
              (route.name != PAGES.driftDebug.name) &&
              !kHideDebugDb) {
            return DebuggerWrapper(child: child);
          }
          return child;
        },
        {{/uses_db}}
        {{^uses_db}}
        builder: (context, state) => route.builder(context, state),
        {{/uses_db}}
      ),
    )
    .toList();

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  routes: routes,
  errorBuilder: (context, state) => const NotFoundScreen(),
);
