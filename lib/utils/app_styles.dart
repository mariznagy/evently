import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppFonts{
  static TextStyle med14Black= GoogleFonts.inter(
      color: AppColors.blackColor,
      fontSize: 14,
      fontWeight: FontWeight.w500
  );
  static TextStyle bold14Black= GoogleFonts.inter(
      color: AppColors.blackColor,
      fontSize: 14,
      fontWeight: FontWeight.bold
  );
  static TextStyle bold14Primary = GoogleFonts.inter(
      color: AppColors.primaryLightColor,
      fontSize: 14,
      fontWeight: FontWeight.bold
  );
  static TextStyle bold16black = GoogleFonts.inter(
      color: AppColors.blackColor,
      fontSize: 16,
      fontWeight: FontWeight.bold
  );
  static TextStyle bold16white = GoogleFonts.inter(
      color: AppColors.lightBgColor,
      fontSize: 16,
      fontWeight: FontWeight.bold
  );
  static TextStyle bold16primary = GoogleFonts.inter(
      color: AppColors.primaryLightColor,
      fontSize: 16,
      fontWeight: FontWeight.bold
  );
  static TextStyle med16white = GoogleFonts.inter(
      color: AppColors.lightBgColor,
      fontSize: 16,
      fontWeight: FontWeight.w500
  );
  static TextStyle med16primary = GoogleFonts.inter(
      color: AppColors.primaryLightColor,
      fontSize: 16,
      fontWeight: FontWeight.w500
  );
  static TextStyle med16grey = GoogleFonts.inter(
      color: AppColors.greyColor,
      fontSize: 16,
      fontWeight: FontWeight.w500
  );
  static TextStyle med16black = GoogleFonts.inter(
      color: AppColors.blackColor,
      fontSize: 16,
      fontWeight: FontWeight.w500
  );
  static TextStyle med20white = GoogleFonts.inter(
      color: AppColors.lightBgColor,
      fontSize: 20,
      fontWeight: FontWeight.w500
  );
  static TextStyle med20primary = GoogleFonts.inter(
      color: AppColors.primaryLightColor,
      fontSize: 20,
      fontWeight: FontWeight.w500
  );
  static TextStyle med20black = GoogleFonts.inter(
      color: AppColors.blackColor,
      fontSize: 20,
      fontWeight: FontWeight.w400
  );
  static TextStyle reg16black = GoogleFonts.inter(
      color: AppColors.blackColor,
      fontSize: 16,
      fontWeight: FontWeight.w200
  );
  static TextStyle bold20white = GoogleFonts.inter(
      color: AppColors.lightBgColor,
      fontSize: 20,
      fontWeight: FontWeight.bold
  );
  static TextStyle reg20white = GoogleFonts.inter(
      color: AppColors.lightBgColor,
      fontSize: 20,
      fontWeight: FontWeight.normal
  );
  static TextStyle bold20dark = GoogleFonts.inter(
      color: AppColors.darkBgColor,
      fontSize: 20,
      fontWeight: FontWeight.bold
  );
  static TextStyle bold20Primary = GoogleFonts.inter(
      color: AppColors.primaryLightColor,
      fontSize: 20,
      fontWeight: FontWeight.bold
  );
  static TextStyle bold24white = GoogleFonts.inter(
      color: AppColors.lightBgColor,
      fontSize: 24,
      fontWeight: FontWeight.bold
  );

}