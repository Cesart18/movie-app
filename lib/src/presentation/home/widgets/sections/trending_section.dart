part of '../../base/home_page.dart';

class _TrendingSection extends StatelessWidget {
  const _TrendingSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final isLoading = state.status.isLoading;

        return Section(
          title: 'Tendencia',
          // NOTE: Use SingleChildScrollView with Row to have ensure
          // spacing between cards
          child: state.status.isFailure
              ? OnErrorWidget(
                  message: 'No se pudieron cargar las películas en tendencia.',
                  onRetry: () => context.read<TrendingMoviesBloc>().add(
                    const TrendingMoviesRequested(),
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: WidthValues.spacingMd,
                    children: [
                      if (isLoading)
                        ...List.generate(
                          3,
                          (index) => _MovieCard(
                            movie: Movie.empty(),
                            isLoading: isLoading,
                          ),
                        )
                      else
                        ...state.movies.map(
                          (m) => _MovieCard(
                            movie: m,
                            isLoading: state.status.isLoading,
                          ),
                        ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
