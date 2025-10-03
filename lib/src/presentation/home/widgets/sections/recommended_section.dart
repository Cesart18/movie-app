part of '../../base/home_page.dart';

class _RecommendedSection extends StatelessWidget {
  const _RecommendedSection();

  @override
  Widget build(BuildContext context) {
    const cardWidth = 156.0;
    const cardHeight = 205.0;

    return BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final isLoading = state.status.isLoading;

        return Section(
          title: 'Recomendaciones para ti',
          child: state.status.isFailure
              ? OnErrorWidget(
                  message: 'No se pudieron cargar las recomendaciones.',
                  onRetry: () => context.read<TrendingMoviesBloc>().add(
                    const TrendingMoviesRequested(),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _MovieFilters(),
                    SizedBox(height: WidthValues.spacing2xl),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: WidthValues.spacing3xl,
                      crossAxisSpacing: WidthValues.spacingLg,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: cardWidth / cardHeight,
                      children: [
                        if (isLoading)
                          ...List.generate(
                            4,
                            (index) => _MovieCard(
                              movie: Movie.empty(),
                              cardWidth: cardWidth,
                              cardHeight: cardHeight,
                              isLoading: isLoading,
                            ),
                          )
                        else
                          ...state.filteredMovies.map(
                            (m) => _MovieCard(
                              movie: m,
                              cardWidth: cardWidth,
                              cardHeight: cardHeight,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }
}
