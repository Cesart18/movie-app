import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/core/ui.dart';
import 'package:movie_app/src/domain/entities/entities.dart';
import 'package:movie_app/src/domain/use_cases/use_cases.dart';

part 'movie_videos_event.dart';
part 'movie_videos_state.dart';

class MovieVideosBloc extends Bloc<MovieVideosEvent, MovieVideosState> {
  MovieVideosBloc({
    required GetMovieVideosUseCase useCase,
    required int movieId,
  }) : _useCase = useCase,
       _movieId = movieId,
       super(const MovieVideosState()) {
    on<MovieVideosRequested>(_onMovieVideosRequested);
    add(const MovieVideosRequested());
  }

  final GetMovieVideosUseCase _useCase;
  final int _movieId;

  Future<void> _onMovieVideosRequested(
    MovieVideosRequested event,
    Emitter<MovieVideosState> emit,
  ) async {
    emit(state.copyWith(status: MovieVideosStatus.loading));
    final result = await _useCase.execute(
      GetMovieVideosParams(movieId: _movieId),
    );

    if (result is Failure) {
      emit(
        state.copyWith(
          status: MovieVideosStatus.failure,
          errorMessage: result.error?.message ?? '',
        ),
      );
      return;
    }

    emit(
      state.copyWith(status: MovieVideosStatus.success, videos: result.data),
    );
  }
}
