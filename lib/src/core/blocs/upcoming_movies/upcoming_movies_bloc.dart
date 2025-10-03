import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';
import 'package:movie_app/src/domain/use_cases/movie/movie.dart';

part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  UpcomingMoviesBloc({
    required GetUpcomingMoviesUseCase getUpcomingMoviesUseCase,
  }) : _getUpcomingMoviesUseCase = getUpcomingMoviesUseCase,
       super(const UpcomingMoviesState()) {
    on<UpcomingMoviesRequested>(_onUpcomingMoviesRequested);
    add(const UpcomingMoviesRequested());
  }

  final GetUpcomingMoviesUseCase _getUpcomingMoviesUseCase;

  Future<void> _onUpcomingMoviesRequested(
    UpcomingMoviesRequested event,
    Emitter<UpcomingMoviesState> emit,
  ) async {
    emit(state.copyWith(status: UpcomingMoviesStatus.loading));

    final result = await _getUpcomingMoviesUseCase.execute();

    if (result is Failure) {
      emit(
        state.copyWith(
          status: UpcomingMoviesStatus.failure,
          errorMessage: result.error?.message,
        ),
      );
      return;
    }

    emit(
      state.copyWith(status: UpcomingMoviesStatus.success, movies: result.data),
    );
  }
}
