import 'package:movie_app/src/core/ui.dart';

class Section extends StatelessWidget {
  const Section({required this.title, required this.child, super.key});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: WidthValues.spacing3xl,
      children: [
        Text(title, style: ExtendedTextTheme.textExtraLarge(context)),
        child,
      ],
    );
  }
}
