part of '../../base/home_page.dart';

class _RecommendedSection extends StatelessWidget {
  const _RecommendedSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Section(
          title: 'Recomendaciones para ti',
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: WidthValues.spacing3xl,
            crossAxisSpacing: WidthValues.spacingLg,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 156 / 205,
            children: [
              ...state.movies.map(
                (m) => _MovieCard(
                  movie: m,
                  cardWidth: 156,
                  cardHeight: 205,
                  isLoading: state.status.isLoading,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
