part of '../base/home_page.dart';

class _MovieCard extends StatelessWidget {
  const _MovieCard({
    required this.movie,
    this.cardWidth = 138,
    this.cardHeight = 180,
    this.isLoading = false,
  });

  final Movie movie;
  final double cardWidth;
  final double cardHeight;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SkeletonContainer(
        width: cardWidth,
        height: cardHeight,
        borderRadius: 8,
      );
    }
    return Container(
      width: cardWidth,
      height: cardHeight,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(right: WidthValues.spacingLg),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: CachedNetworkImageAdapter(imageUrl: movie.posterPath),
    );
  }
}
