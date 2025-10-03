part of '../../base/home_page.dart';

class _TrendingSection extends StatelessWidget {
  const _TrendingSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Section(
          title: 'Tendencia',
          // NOTE: Use SingleChildScrollView with Row to have ensure
          // spacing between cards
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: WidthValues.spacingMd,
              children: [
                ...state.movies.map(
                  (m) =>
                      _MovieCard(movie: m, isLoading: state.status.isLoading),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
