part of 'movie_videos_bloc.dart';

abstract class MovieVideosEvent extends Equatable {
  const MovieVideosEvent();

  @override
  List<Object> get props => [];
}

class MovieVideosRequested extends MovieVideosEvent {
  const MovieVideosRequested();
}
