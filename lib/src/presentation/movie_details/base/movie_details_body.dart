part of 'package:movie_app/src/presentation/movie_details/base/movie_details_page.dart';

// NOTE: Declare all the UI widgets here, including BlocBuilders.
/// {@template movie_details_body}
/// Body of the MovieDetailsPage.
/// {@endtemplate}
class _MovieDetailsBody extends StatelessWidget {
  /// {@macro movie_details_body}
  const _MovieDetailsBody();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<_MovieDetailsBloc, _MovieDetailsState>(
      builder: (context, state) {
        final movie = state.currentMovie;

        if (movie == null) {
          return const SizedBox.shrink();
        }

        return Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImageAdapter(imageUrl: movie.backdropPath),
            ),

            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.black.withValues(alpha: 0.1),
                      Colors.black.withValues(alpha: 0.4),
                    ],
                  ),
                ),
              ),
            ),

            Positioned.fill(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: WidthValues.containerPadding,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: WidthValues.containerPadding,
                      children: [
                        SizedBox(height: size.height * 0.5),
                        Text(
                          movie.title,
                          style: ExtendedTextTheme.displaySmall(context),
                        ),

                        _Tags(movie: state.currentMovie),

                        _GenresWidget(movie: movie),

                        BlocBuilder<MovieVideosBloc, MovieVideosState>(
                          buildWhen: (previous, current) => previous != current,
                          builder: (context, state) {
                            if (state.status.isLoading) {
                              return const SizedBox(
                                height: 60,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }

                            if (state.status.isFailure) {
                              return Text(
                                state.errorMessage,
                                style: ExtendedTextTheme.textMedium(
                                  context,
                                ).copyWith(color: Colors.red),
                              );
                            }
                            if (state.videos.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return _WatchTrailerButton(
                              videoId: state.videos.first.key,
                            );
                          },
                        ),

                        Text(
                          movie.overview,
                          style: ExtendedTextTheme.textMedium(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
