import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor palette = MaterialColor(_palettePrimaryValue, <int, Color>{
    50: Color(0xFFF2E4E4),
    100: Color(0xFFDFBCBC),
    200: Color(0xFFC99090),
    300: Color(0xFFB36363),
    400: Color(0xFFA34141),
    500: Color(_palettePrimaryValue),
    600: Color(0xFF8B1C1C),
    700: Color(0xFF801818),
    800: Color(0xFF761313),
    900: Color(0xFF640B0B),
  });
  static const int _palettePrimaryValue = 0xFF932020;

  static const MaterialColor paletteAccent = MaterialColor(_paletteAccentValue, <int, Color>{
    100: Color(0xFFFF9797),
    200: Color(_paletteAccentValue),
    400: Color(0xFFFF3131),
    700: Color(0xFFFF1818),
  });
  static const int _paletteAccentValue = 0xFFFF6464;
}