import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppLanguageProvider extends ChangeNotifier{
  //todo: data default
  String appLanguage = 'en';
  // todo: function to change data
  void changeLanguage(String newLanguage){
    if (appLanguage == newLanguage){
      return;
    }
    // change data
    appLanguage=newLanguage;
    // bbl8 an data at8ert
    notifyListeners();
  }
}