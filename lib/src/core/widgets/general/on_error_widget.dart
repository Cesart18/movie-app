import 'package:movie_app/src/core/ui.dart';

class OnErrorWidget extends StatelessWidget {
  const OnErrorWidget({super.key, this.message, this.onRetry});

  final String? message;
  final void Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            message ?? 'Error al cargar peliculas',
            style: ExtendedTextTheme.textMedium(context),
          ),

          TextButton(
            onPressed: onRetry,
            child: Text(
              'Reintentar',
              style: ExtendedTextTheme.textMedium(context).copyWith(
                decoration: TextDecoration.underline,
                decorationColor: ColorValues.textPrimary(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
