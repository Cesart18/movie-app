part of '../../base/home_page.dart';

class _UpcomingSection extends StatelessWidget {
  const _UpcomingSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final isLoading = state.status.isLoading;

        return Section(
          title: 'Próximos estrenos',

          // NOTE: Use SingleChildScrollView with Row to have ensure
          // spacing between cards
          child: state.status.isFailure
              ? OnErrorWidget(
                  message: 'No se pudieron cargar los próximos estrenos.',
                  onRetry: () => context.read<UpcomingMoviesBloc>().add(
                    const UpcomingMoviesRequested(),
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
