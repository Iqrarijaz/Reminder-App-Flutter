import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
const Color bluishColor = Color(0xFF4e5ae8);
const Color yellowColor = Color(0xFFFFB746);
const Color pinkColor = Color(0xFFFF4667);
const Color whiteColor = Colors.white;
const Color darkGreyColor = Color(0xFF121212);
const Color darkHeaderColor = Color(0xFF424242);
const primaryClr = bluishColor;

class Themes {
  static final light = ThemeData(
      backgroundColor: Colors.white,
      primarySwatch: Colors.indigo,
      brightness: Brightness.light);
  static final dark = ThemeData(
      backgroundColor: darkGreyColor,
      primarySwatch: Colors.indigo,
      brightness: Brightness.dark);
}

TextStyle get subHeadtingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 24,
          fontWeight:
          FontWeight.bold,
          color: Get.isDarkMode?Colors.grey[500]:Colors.grey
      )
  );
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 30,
          fontWeight:
          FontWeight.bold,
        color: Get.isDarkMode?Colors.white:Colors.black
      )
  );
}
TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode?Colors.white:Colors.black
      )
  );
}
TextStyle get subTitleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
      )
  );
}