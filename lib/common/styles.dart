import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFFD52525);
const Color secondaryColor = Color(0xFFFF7D42);
const Color blue = Color(0xFF0578EC);
const Color blackText = Color(0xFF212121);
const Color greyText = Color(0xFFB0B0B0);
const Color greyText2 = Color(0xFF5B5B5B);
const Color greyText3 = Color(0xFF868686);
const Color grey01 = Color(0xFFE5E5E5);
const Color grey02 = Color(0xFFA4A4A4);
const Color greyStroke = Color(0xFFB5B5B5);
const Color greyBackground = Color(0xFFE7E7E7);
const Color backgroundColor = Color(0xFFF6F6F6);
const Color green = Color(0xFF00A624);
const Color greyIcon = Color(0xFFDEDEDE);
const Color orange = Color(0xFFFFDA15);
const Color lightRed = Color(0xFFFFAFAF);
const Color lightGreen = Color(0xFF67EF85);
const Color lightBlue = Color(0xFFA3D1FF);
const Color lightBlue2 = Color(0xFF88C3FE);
const Color lightBlue3 = Color(0xFF6CB4FD);
const Color lightBlue4 = Color(0xFFCEE4FF);
const Color darkBlue = Color(0xFF001E3C);

final TextTheme myTextTheme = TextTheme(
  displayLarge: GoogleFonts.poppins(fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5, color: blackText),
  displayMedium: GoogleFonts.poppins(fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5, color: blackText),
  displaySmall: GoogleFonts.poppins(fontSize: 46, fontWeight: FontWeight.w400, color: blackText),
  headlineMedium: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: blackText),
  headlineSmall: GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400, color: blackText),
  titleLarge: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15, color: blackText),
  titleMedium: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15, color: blackText),
  titleSmall: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1, color: blackText),
  bodyLarge: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5, color: blackText),
  bodyMedium: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: blackText),
  labelLarge: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.6, color: blackText),
  bodySmall: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4, color: blackText),
  labelSmall: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5, color: blackText),
);

final appbarTitleStyle = myTextTheme.titleLarge?.copyWith(color: Colors.white);

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