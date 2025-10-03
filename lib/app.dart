import 'package:movie_app/config.dart';
import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/core/routes/router.dart';
import 'package:movie_app/src/core/ui.dart';
import 'package:movie_app/src/domain/use_cases/use_cases.dart';

class App extends StatelessWidget {
  const App({required this.config, super.key});

  final Config config;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _dependencies(config),
      child: MaterialApp.router(
        title: 'eMovie',
        theme: AppTheme.theme(context),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}

List<SingleChildWidget> _dependencies(Config config) {
  RepositoryProvider.value(value: config.configRepository);
  RepositoryProvider.value(value: config.movieRepository);

  return [
    BlocProvider(create: (context) => SplashBloc()),
    BlocProvider(
      create: (context) => TrendingMoviesBloc(
        getTrendingMoviesUseCase: GetTrendingMoviesUseCase(
          movieRepository: config.movieRepository,
        ),
      ),
    ),
    BlocProvider(
      create: (context) => UpcomingMoviesBloc(
        getUpcomingMoviesUseCase: GetUpcomingMoviesUseCase(
          movieRepository: config.movieRepository,
        ),
      ),
    ),
  ];
}
