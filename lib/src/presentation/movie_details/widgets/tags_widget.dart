part of '../base/movie_details_page.dart';

class _Tags extends StatelessWidget {
  const _Tags({required this.movie});

  final MovieDetails? movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: WidthValues.spacingMd,
      children: [
        CustomTag(text: movie?.releaseYearDate ?? ''),
        CustomTag(text: movie?.firstSpokenLanguage.iso6391 ?? ''),

        CustomTag(
          text: movie?.voteAverage.toString() ?? '',
          leadingIcon: const Icon(Icons.star),
          color: const Color(0xFFF6C700),
        ),
      ],
    );
  }
}
