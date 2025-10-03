part of '../base/movie_details_page.dart';

class _WatchTrailerButton extends StatelessWidget {
  const _WatchTrailerButton({required this.videoId});

  final String videoId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        YoutubePlayerAdapter.open(context, videoId);
      },
      child: SizedBox(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.all(WidthValues.spacingXl),
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.6,
              color: ColorValues.borderPrimary(context).withValues(alpha: 0.5),
            ),
            borderRadius: BorderRadius.circular(WidthValues.radiusLg),
          ),
          child: Center(
            child: Text(
              'Ver trailer',
              style: ExtendedTextTheme.textMedium(
                context,
              ).copyWith(fontWeight: TextValues.semibold),
            ),
          ),
        ),
      ),
    );
  }
}
