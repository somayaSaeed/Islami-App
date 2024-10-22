import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamproject/utils/colors/colors.dart';

class MyThemeData {
  /// light mode
  // ignore: non_constant_identifier_names
  static final ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.elMessiri(
        textStyle: TextStyle(
          color: ColorsApp.DarkBrownColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      bodyLarge: GoogleFonts.elMessiri(
        textStyle: TextStyle(
            color: ColorsApp.DarkBrownColor,
            fontSize: 25,
            fontWeight: FontWeight.w300),
      ),bodySmall: GoogleFonts.inter(
      textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300),
    ),
      bodyMedium: GoogleFonts.inter(
        textStyle: TextStyle(
            color: ColorsApp.DarkBrownColor,
            fontSize: 25,
            fontWeight: FontWeight.w300),
      ),
    ),
    dataTableTheme: DataTableThemeData(
      headingTextStyle: GoogleFonts.elMessiri(
        textStyle: TextStyle(
            color: ColorsApp.DarkBrownColor,
            fontSize: 25,
            fontWeight: FontWeight.w600),
      ),
    ),
  );

  static final ThemeData LightMode = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.elMessiri(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      bodyLarge: GoogleFonts.elMessiri(
        textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w300),
      ),
      bodyMedium: GoogleFonts.inter(
        textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w300),
      ),
      bodySmall: GoogleFonts.inter(
      textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w300),
    ),
    ),
    dataTableTheme: DataTableThemeData(
      headingTextStyle: GoogleFonts.elMessiri(
        textStyle: TextStyle(
            color: ColorsApp.yellow,
            fontSize: 25,
            fontWeight: FontWeight.w600),

      ),
    ),
  );

}
