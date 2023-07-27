import 'package:flutter/material.dart';

const COLOR_PRIMARY = Color.fromARGB(255, 194, 235, 243);
const COLOR_CANVAS = Color.fromARGB(255, 245, 245, 245);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: COLOR_PRIMARY,
  canvasColor: COLOR_CANVAS,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: 65.00, vertical: 15.00)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0))),
          backgroundColor: MaterialStateProperty.all<Color>(COLOR_PRIMARY))),
);

ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
