import 'package:movie_app/src/adapters/adapters.dart';
import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/core/ui.dart';
import 'package:movie_app/src/domain/entities/entities.dart';
import 'package:movie_app/src/presentation/movie_details/movie_details.dart';

part 'package:movie_app/src/presentation/home/base/home_body.dart';

part '../bloc/language_filter_bloc.dart';
part '../bloc/language_filter_event.dart';
part '../bloc/language_filter_state.dart';

part '../widgets/sections/upcoming_section.dart';
part '../widgets/sections/trending_section.dart';
part '../widgets/sections/recommended_section.dart';
part '../widgets/movie_card.dart';
part '../widgets/movie_filters.dart';

part 'listeners/upcoming_movie_listener.dart';
part 'listeners/trending_movie_listener.dart';

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
    return BlocProvider(
      create: (context) => _LanguageFilterBloc(),
      child: MultiBlocListener(
        listeners: [_UpcomingMovieListener(), _TrendingMovieListener()],
        child: const _HomeBody(),
      ),
    );
  }
}
