import 'package:flutter/material.dart';

import 'app_palette.dart';

class AppFonts {
  static const titleWhite = TextStyle(
    color: AppPalette.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    shadows: [
      BoxShadow(
        color: AppPalette.black,
        offset: Offset(0, 0),
        spreadRadius: 1.0,
        blurRadius: 16,
      )
    ],
  );
  static const subtileWhite = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: AppPalette.white,
    shadows: [
      BoxShadow(
        color: AppPalette.black,
        offset: Offset(0, 0),
        spreadRadius: 1.0,
        blurRadius: 16,
      )
    ],
  );
  static const subtitleSmallWhite = TextStyle(
    color: AppPalette.white,
  );
  static const bodyTitle = TextStyle(
      color: AppPalette.black,
      fontSize: 17,
      fontWeight: FontWeight.bold,
      height: 1.5);
  static const bodyText = TextStyle(
    color: AppPalette.black,
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );
}
