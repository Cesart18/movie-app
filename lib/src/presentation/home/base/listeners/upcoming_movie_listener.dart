part of '../home_page.dart';

class _UpcomingMovieListener
    extends BlocListener<UpcomingMoviesBloc, UpcomingMoviesState> {
  _UpcomingMovieListener()
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
