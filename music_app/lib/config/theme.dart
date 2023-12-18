import 'package:flutter/material.dart';
import 'package:music_app/config/colors.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme:const  ColorScheme.dark(
    background: bgColor,
    primary: primaryColor,
  ),
  
  textTheme:const TextTheme(
    bodyLarge: TextStyle(
      fontFamily: "Roboto",
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: fontColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Roboto",
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: fontColor,
    ),
    bodySmall: TextStyle(
      fontFamily: "Roboto",
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: lableColor,
    ),
    labelSmall: TextStyle(
      fontFamily: "Roboto",
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: lableColor,
    ),
    labelMedium: TextStyle(
      fontFamily: "Roboto",
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: lableColor,
    ),
  )

);



