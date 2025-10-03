part of 'package:movie_app/src/presentation/home/base/home_page.dart';

// NOTE: Declare all the UI widgets here, including BlocBuilders.
/// {@template home_body}
/// Body of the HomePage.
/// {@endtemplate}
class _HomeBody extends StatelessWidget {
  /// {@macro home_body}
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: WidthValues.containerPadding,
        vertical: WidthValues.spacing3xl,
      ),
      child: SingleChildScrollView(
        child: Column(
          spacing: WidthValues.spacing4xl,
          children: const [
            _UpcomingSection(),
            _TrendingSection(),
            _RecommendedSection(),
          ],
        ),
      ),
    );
  }
}
