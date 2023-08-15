import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF233856);
const Color secondaryColor = Color(0xFFEF6356);
const Color blue = Color(0xFF1B61BA);
const Color orange = Color(0xFFFFC861);
const Color green = Color(0xFF67C636);
const Color green2 = Color(0xFF1BBABA);

const Color blackText = Color(0xFF212121);
const Color greyText = Color(0xFFB0B0B0);
const Color greyText2 = Color(0xFF5B5B5B);
const Color greyText3 = Color(0xFF868686);
const Color grey01 = Color(0xFFE5E5E5);
const Color grey02 = Color(0xFFA4A4A4);
const Color greyStroke = Color(0xFFB5B5B5);
const Color greyBackground = Color(0xFFE7E7E7);
const Color backgroundColor = Color(0xFFF6F6F6);
const Color backgroundColor2 = Color(0xFFECF6FF);
const Color greyIcon = Color(0xFFDEDEDE);
const Color lightRed = Color(0xFFFFAFAF);
const Color lightGreen = Color(0xFF67EF85);
const Color lightBlue = Color(0xFFA3D1FF);
const Color lightBlue2 = Color(0xFF88C3FE);
const Color lightBlue3 = Color(0xFF6CB4FD);
const Color lightBlue4 = Color(0xFFCEE4FF);
const Color darkBlue = Color(0xFF001E3C);

final TextTheme myTextTheme = TextTheme(
  displayLarge: TextStyle(fontFamily: 'Poppins', fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5, color: blackText),
  displayMedium: TextStyle(fontFamily: 'Poppins', fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5, color: blackText),
  displaySmall: TextStyle(fontFamily: 'Poppins', fontSize: 46, fontWeight: FontWeight.w400, color: blackText),
  headlineMedium: TextStyle(fontFamily: 'Poppins', fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: blackText),
  headlineSmall: TextStyle(fontFamily: 'Poppins', fontSize: 23, fontWeight: FontWeight.w400, color: blackText),
  titleLarge: TextStyle(fontFamily: 'Poppins', fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15, color: blackText),
  titleMedium: TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15, color: blackText),
  titleSmall: TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1, color: blackText),
  bodyLarge: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5, color: blackText),
  bodyMedium: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: blackText),
  labelLarge: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.6, color: blackText),
  bodySmall: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4, color: blackText),
  labelSmall: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5, color: blackText),
);

final appbarTitleStyle = myTextTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w600);

final whiteCardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
          color: grey02.withOpacity(0.35),
          spreadRadius: 1,
          blurRadius: 2
      )
    ]
);