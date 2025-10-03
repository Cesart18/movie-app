part of '../../base/home_page.dart';

class _UpcomingSection extends StatelessWidget {
  const _UpcomingSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Section(
          title: 'Próximos estrenos',

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
