import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryLightColor,
      focusColor: AppColors.lightBgColor,
    scaffoldBackgroundColor: AppColors.lightBgColor,
    appBarTheme: AppBarTheme(
iconTheme: IconThemeData(
  color: AppColors.primaryLightColor
),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          )
      ),
    ),
    textTheme: TextTheme(headlineLarge: AppFonts.bold20dark,
    headlineMedium:AppFonts.med16primary,
      headlineSmall:AppFonts.med16white,
      titleLarge: AppFonts.med16black,
      titleMedium: AppFonts.med16grey
    ),
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
       backgroundColor: AppColors.primaryLightColor,
       type: BottomNavigationBarType.fixed,
       selectedItemColor: AppColors.lightBgColor,
       unselectedItemColor: AppColors.lightBgColor
     ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: AppColors.lightBgColor,
            width: 4
          ),
        ),
      )
  );
  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.primaryLightColor,
    focusColor: AppColors.primaryLightColor,
    scaffoldBackgroundColor: AppColors.darkBgColor,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
            color: AppColors.primaryLightColor,

        ),
          //backgroundColor: AppColors.darkBgColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            )
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: AppFonts.bold20white,
          headlineMedium:AppFonts.med16white,
        headlineSmall:AppFonts.med16white,
        titleLarge: AppFonts.med16white,
          titleMedium: AppFonts.med16white

      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkBgColor,
          type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.lightBgColor,
          unselectedItemColor: AppColors.lightBgColor
  ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
            color: AppColors.lightBgColor,
            width: 4
        ),
      ),
    )
  );
}