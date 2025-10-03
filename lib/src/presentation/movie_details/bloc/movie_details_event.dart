part of 'package:movie_app/src/presentation/movie_details/base/movie_details_page.dart';

abstract class _MovieDetailsEvent extends Equatable {
  const _MovieDetailsEvent();

  @override
  List<Object?> get props => [];
}

class MovieDetailsRequested extends _MovieDetailsEvent {
  const MovieDetailsRequested();
}
