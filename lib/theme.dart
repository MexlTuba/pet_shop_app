// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: Color(0xFFE8BE13),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.yellow,
    accentColor: Color(0xFF333333),
  ).copyWith(
    secondary: Color(0xFF333333),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    displayLarge: TextStyle(
        fontSize: 26.27, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
    bodyLarge: TextStyle(
        fontSize: 17.51, fontFamily: 'Poppins', color: Color(0xFFA1A1A1)),
    labelLarge: TextStyle(
        fontSize: 17.51,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter'), // Style for buttons
  ),
  // Define other theme attributes if needed
);

const Color primaryColor = Color(0xFFFDBE3B);
const Color secondaryColor = Color(0xFFFEF2E7);
const Color accentColor = Color(0xFF333333);
