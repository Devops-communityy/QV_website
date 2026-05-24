import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QVTheme {
  // Light theme brand colors
  static const Color teal        = Color(0xFF0F6E56);
  static const Color tealMid     = Color(0xFF1D9E75);
  static const Color tealBg      = Color(0xFFE1F5EE);
  static const Color tealBorder  = Color(0xFF5DCAA5);
  static const Color orange      = Color(0xFF993C1D);
  static const Color orangeBg    = Color(0xFFFAECE7);
  static const Color orangeBorder= Color(0xFFF0997B);
  static const Color blue        = Color(0xFF185FA5);
  static const Color blueBg      = Color(0xFFE6F1FB);
  static const Color blueBorder  = Color(0xFF85B7EB);
  static const Color purple      = Color(0xFF534AB7);
  static const Color purpleBg    = Color(0xFFEEEDFE);
  static const Color purpleBorder= Color(0xFFAFA9EC);
  static const Color txtPrimary  = Color(0xFF1a1a1a);
  static const Color txtSecond   = Color(0xFF555555);
  static const Color txtMuted    = Color(0xFF888888);
  static const Color border      = Color(0xFFE8E8E8);
  static const Color border2     = Color(0xFFD0D0D0);
  static const Color bgWhite     = Color(0xFFFFFFFF);
  static const Color bgSurface   = Color(0xFFF7F7F5);

  // Typography
  static TextStyle display1({Color color = txtPrimary}) => GoogleFonts.spaceGrotesk(
        fontSize: 48, fontWeight: FontWeight.w800,
        height: 1.1, letterSpacing: -1.8, color: color);

  static TextStyle display2({Color color = txtPrimary}) => GoogleFonts.spaceGrotesk(
        fontSize: 36, fontWeight: FontWeight.w700,
        height: 1.15, letterSpacing: -1.2, color: color);

  static TextStyle h3({Color color = txtPrimary}) => GoogleFonts.spaceGrotesk(
        fontSize: 28, fontWeight: FontWeight.w700,
        height: 1.2, letterSpacing: -0.6, color: color);

  static TextStyle h4({Color color = txtPrimary}) => GoogleFonts.spaceGrotesk(
        fontSize: 20, fontWeight: FontWeight.w600,
        height: 1.3, color: color);

  static TextStyle body({Color color = txtSecond}) => GoogleFonts.inter(
        fontSize: 15, fontWeight: FontWeight.w400,
        height: 1.65, color: color);

  static TextStyle bodySmall({Color color = txtMuted}) => GoogleFonts.inter(
        fontSize: 13, fontWeight: FontWeight.w400,
        height: 1.6, color: color);

  static TextStyle label({Color color = teal}) => GoogleFonts.jetBrainsMono(
        fontSize: 10, fontWeight: FontWeight.w500,
        letterSpacing: 1.2, color: color);

  static TextStyle mono({Color color = teal, double size = 13}) => GoogleFonts.jetBrainsMono(
        fontSize: size, fontWeight: FontWeight.w400, color: color);

  // Light Theme
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: bgWhite,
        primaryColor: tealMid,
        colorScheme: const ColorScheme.light(
          primary: tealMid,
          secondary: orange,
          surface: bgWhite,
          background: bgSurface,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: tealMid,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            textStyle: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w700, fontSize: 13),
          ),
        ),
      );

  // Keep dark for backward compat
  static ThemeData get dark => light;
}
