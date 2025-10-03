import 'package:movie_app/src/adapters/adapters.dart';
import 'package:movie_app/src/core/ui.dart';
import 'package:movie_app/src/domain/entities/entities.dart';

part 'package:movie_app/src/presentation/home/base/home_body.dart';
part '../widgets/sections/upcoming_section.dart';
part '../widgets/sections/trending_section.dart';
part '../widgets/sections/recommended_section.dart';
part '../widgets/movie_card.dart';

/// {@template home_page}
/// A description for HomePage
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  /// The path name of HomePage. Use for navigation.
  static const path = '/$routeName';

  /// The route name of HomePage. Use to navigate
  /// with named routes.
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset(AssetImages.eMovieLogo, width: 120)),
      body: const _HomeView(),
    );
  }
}

// NOTE: Declare all BlocListeners of Home here to handle navigation,
// showing dialogs, etc.
/// {@template home_view}
/// Displays the Body of HomeView
/// {@endtemplate}
///
class _HomeView extends StatelessWidget {
  /// {@macro home_view}
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return const _HomeBody();
  }
}
