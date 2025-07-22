import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppThemeProvider extends ChangeNotifier{
  //todo: data default
  ThemeMode appTheme = ThemeMode.light;
  // todo: function to change data
  void changeTheme(ThemeMode newTheme){
    if (appTheme == newTheme){
      return;
    }
    // change data
    appTheme=newTheme;
    // bbl8 an data at8ert
    notifyListeners();
  }
  bool isDark(){
    return appTheme== ThemeMode.dark;
  }
  bool isLight(){
    return appTheme== ThemeMode.light;
  }
}