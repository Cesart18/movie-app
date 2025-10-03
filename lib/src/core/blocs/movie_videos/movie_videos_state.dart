part of 'movie_videos_bloc.dart';

enum MovieVideosStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == MovieVideosStatus.initial;
  bool get isLoading => this == MovieVideosStatus.loading;
  bool get isSuccess => this == MovieVideosStatus.success;
  bool get isFailure => this == MovieVideosStatus.failure;
}

/// {@template splash_state}
/// _MovieVideosState description
/// {@endtemplate}
class MovieVideosState extends Equatable {
  /// {@macro splash_state}
  const MovieVideosState({
    this.status = MovieVideosStatus.initial,
    this.videos = const [],
    this.errorMessage = '',
  });

  /// Status of the state
  final MovieVideosStatus status;
  final List<Video> videos;
  final String errorMessage;

  @override
  List<Object> get props => [status, videos, errorMessage];

  /// Creates a copy of the current MovieVideosState with property changes
  MovieVideosState copyWith({
    MovieVideosStatus? status,
    List<Video>? videos,
    String? errorMessage,
  }) {
    return MovieVideosState(
      status: status ?? this.status,
      videos: videos ?? this.videos,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
