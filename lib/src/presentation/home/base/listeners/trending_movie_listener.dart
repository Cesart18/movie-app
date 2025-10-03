part of '../home_page.dart';

class _TrendingMovieListener
    extends BlocListener<TrendingMoviesBloc, TrendingMoviesState> {
  _TrendingMovieListener()
    : super(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
      );
}
