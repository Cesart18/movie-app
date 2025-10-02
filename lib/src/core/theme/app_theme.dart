import 'package:flutter/material.dart';
import 'package:movie_app/src/core/theme/extended_text_theme.dart';
import 'package:movie_app/src/core/variables/values/color_values.dart';
import 'package:movie_app/src/core/variables/values/text_values.dart';
import 'package:movie_app/src/core/variables/values/width_values.dart';

class AppTheme {
  static ThemeData theme(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return ThemeData(
      brightness: brightness,
      primaryColor: ColorValues.bgPrimary(context),
      appBarTheme: _CustomThemeValues.appBarTheme(context),
      scaffoldBackgroundColor: ColorValues.bgPrimary(context),
      textTheme: _CustomThemeValues.textTheme(context),
      elevatedButtonTheme: _CustomThemeValues.elevatedButtonTheme(context),
      outlinedButtonTheme: _CustomThemeValues.outlinedButtonTheme(context),
      iconTheme: _CustomThemeValues.iconTheme(context),
      canvasColor: ColorValues.bgSecondary(context),
    );
  }
}

class _CustomThemeValues {
  static TextTheme textTheme(BuildContext context) =>
      TextValues.fontFamily(context).copyWith(
        displayLarge: TextStyle(
          color: ColorValues.textPrimary(context),
          fontWeight: TextValues.bold,
          fontSize: TextValues.displayMd,
        ),
        displayMedium: TextStyle(
          color: ColorValues.textPrimary(context),
          fontWeight: TextValues.bold,
          fontSize: TextValues.displaySm,
        ),
        displaySmall: TextStyle(
          color: ColorValues.textPrimary(context),
          fontWeight: TextValues.bold,
          fontSize: TextValues.displayXs,
        ),
        titleLarge: TextStyle(
          color: ColorValues.textPrimary(context),
          fontWeight: TextValues.bold,
          fontSize: TextValues.displayXs,
        ),
        titleSmall: TextStyle(
          color: ColorValues.textPrimary(context),
          fontWeight: TextValues.semibold,
          fontSize: TextValues.textXl,
        ),
        headlineMedium: TextStyle(
          color: ColorValues.textSecondary(context),
          fontWeight: TextValues.semibold,
          fontSize: TextValues.textLg,
        ),
        bodyMedium: TextStyle(
          color: ColorValues.textSecondary(context),
          fontWeight: TextValues.regular,
          fontSize: TextValues.textSm,
        ),
        bodySmall: TextStyle(
          color: ColorValues.textSecondary(context),
          fontWeight: TextValues.regular,
          fontSize: TextValues.textXs,
        ),
      );

  static ElevatedButtonThemeData elevatedButtonTheme(BuildContext context) =>
      ElevatedButtonThemeData(
        style: const ButtonStyle().merge(
          ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.symmetric(
              vertical: WidthValues.spacing2Md,
              horizontal: WidthValues.spacingXl,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(WidthValues.radiusMd),
            ),
            backgroundColor: ColorValues.buttonPrimaryBg(context),
            foregroundColor: ColorValues.buttonPrimaryFg(context),
            textStyle: const TextStyle(
              fontWeight: TextValues.semibold,
              fontSize: TextValues.textMd,
            ),
          ),
        ),
      );

  static OutlinedButtonThemeData outlinedButtonTheme(BuildContext context) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: WidthValues.spacingMd,
            horizontal: WidthValues.spacingXl,
          ),
          foregroundColor: ColorValues.buttonSecondaryFg(context),
          side: BorderSide(
            color: ColorValues.borderPrimary(context),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(WidthValues.radiusMd),
          ),
          textStyle: const TextStyle(
            fontWeight: TextValues.semibold,
            fontSize: TextValues.textMd,
          ),
        ),
      );

  static IconThemeData iconTheme(BuildContext context) =>
      IconThemeData(color: ColorValues.featuredIconFgBrand(context), size: 24);

  static AppBarTheme appBarTheme(BuildContext context) => AppBarTheme(
    backgroundColor: ColorValues.bgPrimary(context),
    elevation: 0,
    titleTextStyle: ExtendedTextTheme.displaySmall(
      context,
    ).copyWith(fontWeight: TextValues.bold),
    actionsIconTheme: IconThemeData(color: ColorValues.textPrimary(context)),
  );
}
