// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
part 'package:movie_app/src/core/ui/variables/constants/color_constants.dart';

class ColorValues {
  // -------------------------------------------------------
  // <---------------- Text color values ------------------>
  // -------------------------------------------------------
  // ----- Use text color variables to manage all text -----
  // ------- fill colors in your designs across light ------
  // ------------------- and dark modes. -------------------
  // -------------------------------------------------------

  static final _textPrimary = _ColorScheme(light: Colors.white);

  static final _textSecondary = _ColorScheme(light: Colors.black);

  /// Primary text such as page headings.
  static Color textPrimary(BuildContext context) =>
      _textPrimary.getColor(context);

  /// Secondary text such as labels and section headings.
  static Color textSecondary(BuildContext context) =>
      _textSecondary.getColor(context);

  // ---------------------------------------------------------
  // <---------------- Border color values ------------------>
  // ---------------------------------------------------------
  // ---- Use border color variables to manage all stroke ----
  // -- colors in your designs across light and dark modes. --
  // ---------------------------------------------------------

  static final _borderPrimary = _ColorScheme(
    light: _ColorConstants.grayLight.shade300,
  );

  /// High contrast borders. These are used for components such as input fields,
  ///  button groups, and checkboxes.
  static Color borderPrimary(BuildContext context) =>
      _borderPrimary.getColor(context);

  // -------------------------------------------------------------
  // <---------------- Foreground color values ------------------>
  // -------------------------------------------------------------
  // -------- Use foreground color variables to manage all -------
  // ---- non-text foreground elements in your designs across ----
  // ------------------- light and dark modes. -------------------
  // -------------------------------------------------------------

  static final _fgPrimary = _ColorScheme(light: Colors.white);

  static final _fgSecondary = _ColorScheme(light: Colors.black);

  static final _fgWhite = _ColorScheme(light: Colors.white);

  /// Highest contrast non-text foreground elements such as icons.
  static Color fgPrimary(BuildContext context) => _fgPrimary.getColor(context);

  /// High contrast non-text foreground elements such as icons.
  static Color fgSecondary(BuildContext context) =>
      _fgSecondary.getColor(context);

  /// Foreground elements that are always white, regardless of the mode.
  static Color fgWhite(BuildContext context) => _fgWhite.getColor(context);

  // -------------------------------------------------------------
  // <---------------- Background color values ------------------>
  // -------------------------------------------------------------
  // - Use background color variables to manage all fill colors  -
  // - for elements in your designs across light and dark modes. -
  // -------------------------------------------------------------

  static final _bgPrimary = _ColorScheme(light: Colors.black);

  static final _bgSecondary = _ColorScheme(light: Colors.white);

  /// The primary background color (white) used across all layouts and
  /// components.
  static Color bgPrimary(BuildContext context) => _bgPrimary.getColor(context);

  /// The secondary background color used to create contrast against white
  /// backgrounds, such as website section backgrounds.
  static Color bgSecondary(BuildContext context) =>
      _bgSecondary.getColor(context);

  // ---------------------------------------------------------
  // <---------------- Button color values ------------------>
  // ---------------------------------------------------------
  // ---- Use this colors for any button used in the app. ----
  // ------ This includes and is not limited to elevated -----
  // ----------- buttons, outlined buttons and cta. ----------
  // ---------------------------------------------------------

  static final _buttonPrimaryBg = _ColorScheme(
    light: _ColorConstants.brandColor.shade600,
  );

  static final _buttonPrimaryFg = _ColorScheme(light: Colors.white);

  static final _buttonSecondaryBg = _ColorScheme(light: Colors.white);

  static final _buttonSecondaryFg = _ColorScheme(light: Colors.black);

  /// Primary button background color.
  static Color buttonPrimaryBg(BuildContext context) =>
      _buttonPrimaryBg.getColor(context);

  /// Primary button foreground color.
  static Color buttonPrimaryFg(BuildContext context) =>
      _buttonPrimaryFg.getColor(context);

  /// Secondary button background color.
  static Color buttonSecondaryBg(BuildContext context) =>
      _buttonSecondaryBg.getColor(context);

  /// Secondary button foreground color.
  static Color buttonSecondaryFg(BuildContext context) =>
      _buttonSecondaryFg.getColor(context);

  // -------------------------------------------------------
  // <---------------- Icon color values ------------------>
  // -------------------------------------------------------
  // ---- Use this colors for any icons used in the app. ---
  // -------------------------------------------------------

  static final _featuredIconFgBrand = _ColorScheme(
    light: _ColorConstants.brandColor.shade600,
  );

  /// Primary brand color foreground for featured icons.
  static Color featuredIconFgBrand(BuildContext context) =>
      _featuredIconFgBrand.getColor(context);
}

class _ColorScheme {
  final Color light;

  _ColorScheme({required this.light});

  Color getColor(BuildContext context) {
    return light;
  }
}
