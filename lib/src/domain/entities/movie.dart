class Movie {
  const Movie({
    required this.id,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.originalLanguage,
  });
  factory Movie.empty() {
    return const Movie(
      id: 0,
      posterPath: '',
      backdropPath: '',
      releaseDate: '',
      originalLanguage: '',
    );
  }
  final int id;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final String originalLanguage;
}
