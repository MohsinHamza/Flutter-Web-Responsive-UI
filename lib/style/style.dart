
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///Created by Mohsin Hamza at 016/01/2022///
///email ayanhamza513@gmail.com///

const Color kBorderColor = Color(0xffD2D5E1);
const Color kIconColor = Color(0xff7C88B1);
const Color kChatBackgroundColor = Color(0xffFAFCFE);

class TextStyles {


  static TextStyle kFieldTitleStyle = GoogleFonts.openSans(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 12,
  );
  static TextStyle kTextFieldHintStyle = GoogleFonts.openSans(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );
  static TextStyle title = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: Palette.BLACK,
      fontSize: 30,
      fontWeight: FontWeight.bold);
  static TextStyle h2 = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: Palette.BLACK,
      fontSize: 24,
      fontWeight: FontWeight.bold);
  static TextStyle h3 = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: Palette.BLACK,
      fontSize: 20,
      fontWeight: FontWeight.bold);
  static TextStyle h4 = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: Palette.BLACK,
      fontSize: 11,
      fontWeight: FontWeight.w300);
  static TextStyle h5 = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    color: Palette.GREY_LIGHT,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static TextStyle h6 = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: Palette.GREY_LIGHT,
      fontSize: 14);
  static TextStyle h7 = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: Palette.BLACK,
      fontSize: 13,
      fontWeight: FontWeight.bold);
  static TextStyle h8 = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: Palette.GREY_LIGHT,
      fontSize: 11);
  static TextStyle h9 = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: Palette.BLACK,
      fontSize: 10);

  static TextStyle textButtonStylePrimarySemiBold = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.w600,
      color: Palette.PRIMARY,
      fontSize: 14);
}

class Palette {
  static const WHITE = Color(0xffffffff);
  static const DARKTEAL = Color(0xFF095F70);
  static const ORANGE = Color(0xffff8822);
  static const BGCOLOR = Color(0xffe5e5e5);
  static const BLACK = Color(0xff191632);
  static const GREY_LIGHT = Color(0xffABAAB1);
  static const GREY_LIGHT_MORE = Color(0xffDFDEE4);
  static const GREY_LIGHTEST = Color(0xfff8f8f8);
  static const GREY = Color(0xff5e5d65);
  static const PRIMARY = Color(0xff6D5AE6);
  static const WARNING = Color(0xffCD504E);
  static const SUCCESS = Color(0xff448F56);
  static const BlueLink = Color(0xff432BDF);
}
