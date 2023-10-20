import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Color(0xff5D9CEC);
  static Color backgroundLight = Color(0xffDFECDB);
  static Color greenColor = Color(0xff61E757);
  static Color redColor = Color(0xffEC4B4B);
  static Color blackColor = Color(0xff383838);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color greyColor = Color(0xff777f8a);
  static Color backgroundDark = Color(0xff060E1E);
  static Color blackDark = Color(0xff141922);
  static ThemeData lightTheme = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: whiteColor, width: 4),
            borderRadius: BorderRadius.circular(36))),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: greyColor,
      selectedItemColor: primaryColor,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    scaffoldBackgroundColor: backgroundLight,
    appBarTheme: AppBarTheme(backgroundColor: primaryColor, elevation: 0),

    textTheme: TextTheme(
        titleSmall: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: blackColor),
        bodySmall:TextStyle(
            fontSize: 20, fontWeight: FontWeight.normal, color: greyColor),
        titleMedium: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: blackColor)
        ,titleLarge: TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor)),

  );
}
