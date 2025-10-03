part of '../splash_page.dart';

class _SplashListener extends BlocListener<SplashBloc, SplashState> {
  _SplashListener()
    : super(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status.isSuccess) {
            context.go(HomePage.path);
          }

          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('Something went wrong. Please try again.'),
                ),
              );
          }
        },
      );
}
