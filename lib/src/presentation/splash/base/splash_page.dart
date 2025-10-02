import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/core/ui.dart';
// ignore: unused_import
import 'package:flutter_animate/flutter_animate.dart';

part 'package:movie_app/src/presentation/splash/base/splash_body.dart';

/// {@template splash_page}
/// A description for SplashPage
/// {@endtemplate}
class SplashPage extends StatelessWidget {
  /// {@macro splash_page}
  const SplashPage({super.key});

  /// The path name of SplashPage. Use for navigation.
  static const path = '/$routeName';

  /// The route name of SplashPage. Use to navigate
  /// with named routes.
  static const routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: const Scaffold(body: _SplashView()),
    );
  }
}

/// {@template splash_view}
/// Displays the Body of SplashView
/// {@endtemplate}
///
class _SplashView extends StatelessWidget {
  /// {@macro splash_view}
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    return const _SplashBody();
  }
}
