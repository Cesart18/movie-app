import 'package:movie_app/src/core/ui.dart';

class CustomTag extends StatelessWidget {
  const CustomTag({
    required this.text,
    super.key,
    this.leadingIcon,
    this.color,
  });

  final Widget? leadingIcon;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(WidthValues.spacingMd),
      decoration: BoxDecoration(
        color: color ?? Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(WidthValues.radiusLg),
      ),
      child: Row(children: [?leadingIcon, Text(text)]),
    );
  }
}
