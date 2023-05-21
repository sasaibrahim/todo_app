import 'package:flutter/material.dart';
import 'package:todo_app/shared/styles/app_colors.dart';
import 'package:todo_app/shared/styles/text_style.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: lightgreenColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: lightColor,
        unselectedItemColor: Colors.grey.shade500,
      ),
      primaryColor: lightColor,
      textTheme: TextTheme(
          bodyLarge: Popins22(), bodyMedium: Popins18(), bodySmall: Robot12()),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          backgroundColor: lightColor,
          elevation: 0.0,
          centerTitle: false));
  static ThemeData darkTheme = ThemeData(
      // scaffoldBackgroundColor: Colors.transparent,
      // colorScheme: ColorScheme(
      //     brightness: Brightness.dark,
      //     primary: darkColor,
      //     onPrimary: Colors.white,
      //     secondary: yellowColor,
      //     onSecondary: Colors.white,
      //     error: Colors.red,
      //     onError: Colors.white,
      //     background: Colors.transparent,
      //     onBackground: darkColor,
      //     surface: darkColor,
      //     onSurface: yellowColor),
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   backgroundColor: darkColor,
      //   type: BottomNavigationBarType.shifting,
      //   selectedItemColor: yellowColor,
      //   unselectedItemColor: Colors.white,
      // ),
      // primaryColor: darkColor,
      // textTheme: TextTheme(
      //     bodySmall: GoogleFonts.amiri(
      //       fontSize: 30,
      //       fontWeight: FontWeight.bold,
      //       color: yellowColor,
      //     ),
      //     bodyMedium: GoogleFonts.elMessiri(
      //       fontSize: 25,
      //       fontWeight: FontWeight.bold,
      //       color: yellowColor,
      //     ),
      //     bodyLarge: GoogleFonts.elMessiri(
      //       fontSize: 30,
      //       fontWeight: FontWeight.bold,
      //       color: yellowColor,
      //     )),
      // appBarTheme: AppBarTheme(
      //     iconTheme: IconThemeData(
      //       color: Colors.white,
      //       size: 35,
      //     ),
      //     backgroundColor: Colors.transparent,
      //     elevation: 0.0,
      //     centerTitle: true)
      );
}
