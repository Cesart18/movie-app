part of 'package:movie_app/src/presentation/splash/base/splash_page.dart';

// NOTE: Declare all the UI widgets here, including BlocBuilders.
/// {@template splash_body}
/// Body of the SplashPage.
/// {@endtemplate}
class _SplashBody extends StatefulWidget {
  /// {@macro splash_body}
  const _SplashBody();

  @override
  State<_SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<_SplashBody> {
  @override
  Widget build(BuildContext context) {
    final duration = 500.ms;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorValues.bgPrimary(context), Color(0xFF780606)],
        ),
      ),
      child: Center(
        child: SizedBox(
          height: 120,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Movie logo starts off to the right and will slide in
              Positioned(
                right: 0,
                child: Image.asset(AssetImages.movieLogo, height: 80)
                    .animate(delay: 700.ms)
                    .moveX(
                      begin: 60,
                      end: -50,
                      duration: duration,
                      curve: Curves.easeOut,
                    )
                    .fadeIn(duration: duration),
              ),

              // eLogo starts centered, appears first, then is pushed left
              Positioned(
                child: Image.asset(AssetImages.eLogo, height: 80)
                    .animate()
                    .fadeIn(duration: duration)
                    .then(delay: 200.ms)
                    .moveX(
                      begin: 0,
                      end: -48,
                      duration: duration,
                      curve: Curves.easeInOut,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
