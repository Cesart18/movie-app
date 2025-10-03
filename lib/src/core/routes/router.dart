import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/presentation/home/home.dart';
import 'package:movie_app/src/presentation/movie_details/movie_details.dart';
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

  static GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: SplashPage.path,
    routes: [
      GoRoute(
        name: SplashPage.routeName,
        path: SplashPage.path,
        builder: (context, state) => const SplashPage(),
      ),

      GoRoute(
        name: HomePage.routeName,
        path: HomePage.path,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const HomePage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),

      GoRoute(
        name: MovieDetailsPage.routeName,
        path: MovieDetailsPage.path,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return MovieDetailsPage(movieId: int.parse(id));
        },
      ),
    ],
  );
}
