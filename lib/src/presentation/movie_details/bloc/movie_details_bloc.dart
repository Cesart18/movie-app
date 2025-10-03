part of 'package:movie_app/src/presentation/movie_details/base/movie_details_page.dart';

class _MovieDetailsBloc extends Bloc<_MovieDetailsEvent, _MovieDetailsState> {
  _MovieDetailsBloc({
    required int movieId,
    required GetMovieDetailsUseCase getMovieDetailsUseCase,
  }) : _movieId = movieId,
       _getMovieDetailsUseCase = getMovieDetailsUseCase,
       super(const _MovieDetailsState()) {
    on<MovieDetailsRequested>(_onMovieDetailsRequested);

    add(const MovieDetailsRequested());
  }

  final int _movieId;
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  Future<void> _onMovieDetailsRequested(
    MovieDetailsRequested event,
    Emitter<_MovieDetailsState> emit,
  ) async {
    emit(state.copyWith(status: _MovieDetailsStatus.loading));

    final result = await _getMovieDetailsUseCase.execute(
      GetMovieDetailsParams(movieId: _movieId),
    );

    if (result is Failure) {
      emit(
        state.copyWith(
          status: _MovieDetailsStatus.failure,
          errorMessage: result.error?.message,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        status: _MovieDetailsStatus.success,
        currentMovie: result.data,
      ),
    );
  }
}
