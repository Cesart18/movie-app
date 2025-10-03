import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/core/ui.dart';
import 'package:movie_app/src/domain/entities/entities.dart';
import 'package:movie_app/src/domain/use_cases/movie/movie.dart';

part 'trending_movies_event.dart';
part 'trending_movies_state.dart';

class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  TrendingMoviesBloc({
    required GetTrendingMoviesUseCase getTrendingMoviesUseCase,
  }) : _getTrendingMoviesUseCase = getTrendingMoviesUseCase,
       super(const TrendingMoviesState()) {
    on<TrendingMoviesRequested>(_onTrendingMoviesRequested);
    on<TrendingMoviesFiltered>(_onTrendingMoviesFiltered);
    add(const TrendingMoviesRequested());
  }

  final GetTrendingMoviesUseCase _getTrendingMoviesUseCase;

  Future<void> _onTrendingMoviesRequested(
    TrendingMoviesRequested event,
    Emitter<TrendingMoviesState> emit,
  ) async {
    emit(state.copyWith(status: TrendingMoviesStatus.loading));

    final result = await _getTrendingMoviesUseCase.execute(
      GetTrendingMoviesParams(timeWindow: TimeWindowType.day),
    );

    if (result is Failure) {
      emit(
        state.copyWith(
          status: TrendingMoviesStatus.failure,
          errorMessage: result.error?.message ?? '',
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: TrendingMoviesStatus.success,
        movies: result.data,
        filteredMovies: result.data,
      ),
    );
  }

  void _onTrendingMoviesFiltered(
    TrendingMoviesFiltered event,
    Emitter<TrendingMoviesState> emit,
  ) {
    final filtered = state.movies.where((movie) {
      // Filtro de idioma
      final matchesLanguage =
          event.language == null || movie.originalLanguage == event.language;

      // Filtro de año
      final movieYear = movie.releaseDate.isNotEmpty
          ? DateTime.tryParse(movie.releaseDate)?.year
          : null;
      final matchesYear = event.year == null || movieYear == event.year;

      return matchesLanguage && matchesYear;
    }).toList();

    emit(
      state.copyWith(
        filteredMovies: filtered,
        selectedLanguage: event.language,
        selectedYear: event.year,
        clearLanguage: event.language == null,
        clearYear: event.year == null,
      ),
    );
  }
}
