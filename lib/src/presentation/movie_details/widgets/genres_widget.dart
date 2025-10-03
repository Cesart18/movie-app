part of '../base/movie_details_page.dart';

class _GenresWidget extends StatelessWidget {
  const _GenresWidget({required this.movie});

  final MovieDetails movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...movie.genres.map(
          (genre) => Padding(
            padding: EdgeInsets.only(right: WidthValues.spacingSm),
            child: _GenreTag(genre: genre, isLast: genre == movie.genres.last),
          ),
        ),
      ],
    );
  }
}

class _GenreTag extends StatelessWidget {
  const _GenreTag({required this.genre, required this.isLast});

  final Genre genre;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: WidthValues.spacingMd,
      children: [
        Text(genre.name, style: ExtendedTextTheme.textSmall(context)),
        if (!isLast)
          Container(
            height: 4,
            width: 4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorValues.textPrimary(context),
            ),
          ),
      ],
    );
  }
}
