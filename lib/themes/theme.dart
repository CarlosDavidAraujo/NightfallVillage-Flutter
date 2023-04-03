import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static const _primaryColor = Color(0xFFC7B299);
  static const _foregroundColor = Colors.black;
  static final _elevatedButtonTextStyle = GoogleFonts.germaniaOne(fontSize: 18);
  static final _playerInputStyle = GoogleFonts.pirataOne(fontSize: 30);
}

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: MyTheme._primaryColor,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                 const MaterialStatePropertyAll<Color>(MyTheme._foregroundColor),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  MyTheme._elevatedButtonTextStyle)),
        ),
        textTheme: TextTheme(
            headlineSmall: MyTheme._playerInputStyle,
            labelMedium: MyTheme._elevatedButtonTextStyle,
            titleLarge: GoogleFonts.pirataOne(fontSize: 40)));
  }
}
