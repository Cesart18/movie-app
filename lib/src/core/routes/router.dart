import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/presentation/splash/splash.dart';

/// {@template app_router}
/// The root router for the app. Call [AppRouter.router] to get the router.
/// {@endtemplate}
class AppRouter {
  /// The root navigator key for the app. Use this to navigate from the root
  /// of the router (i.e. out of the bottom navigation bar).
  static final rootNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'root_navigator',
  );

  static final rootScaffoldKey = GlobalKey<ScaffoldState>(
    debugLabel: 'root_scaffold',
  );

  /// The root router for the app. Set [debug] to true to enable debug logging
  /// diagnostics.
  static GoRouter router({bool debug = false}) => GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: debug,
    initialLocation: SplashPage.path,
    routes: [
      GoRoute(
        name: SplashPage.routeName,
        path: SplashPage.path,
        builder: (context, state) => const SplashPage(),
      ),
    ],
  );
}
