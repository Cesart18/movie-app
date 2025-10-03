import 'package:movie_app/src/adapters/network_image/cached_network_image_adapter.dart';
import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/core/ui.dart';
import 'package:movie_app/src/domain/entities/entities.dart';
import 'package:movie_app/src/domain/use_cases/use_cases.dart';

part 'package:movie_app/src/presentation/movie_details/bloc/movie_details_bloc.dart';
part 'package:movie_app/src/presentation/movie_details/bloc/movie_details_event.dart';
part 'package:movie_app/src/presentation/movie_details/bloc/movie_details_state.dart';

part 'package:movie_app/src/presentation/movie_details/base/movie_details_body.dart';
part '../widgets/watch_trailer_button.dart';
part '../widgets/genres_widget.dart';
part '../widgets/tags_widget.dart';

/// {@template movie_details_page}
/// A description for MovieDetailsPage
/// {@endtemplate}
class MovieDetailsPage extends StatelessWidget {
  /// {@macro movie_details_page}
  const MovieDetailsPage({required this.movieId, super.key});

  /// The path name of MovieDetailsPage. Use for navigation.
  static const path = '/$routeName/:id';

  /// The route name of MovieDetailsPage. Use to navigate
  /// with named routes.
  static const routeName = 'movie-details';

  static String buildPath(int id) {
    return path.replaceFirst(':id', id.toString());
  }

  static void pushRoute(BuildContext context, int id) {
    context.push(buildPath(id));
  }

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _MovieDetailsBloc(
        movieId: movieId,
        getMovieDetailsUseCase: GetMovieDetailsUseCase(
          movieRepository: context.read(),
        ),
      ),
      child: Scaffold(appBar: AppBar(), body: const _MovieDetailsView()),
    );
  }
}

// NOTE: Declare all BlocListeners of MovieDetails here to handle navigation,
// showing dialogs, etc.
/// {@template movie_details_view}
/// Displays the Body of MovieDetailsView
/// {@endtemplate}
///
class _MovieDetailsView extends StatelessWidget {
  /// {@macro movie_details_view}
  const _MovieDetailsView();

  @override
  Widget build(BuildContext context) {
    return const _MovieDetailsBody();
  }
}
