import 'package:flutter/material.dart';
import 'package:my_app/themes/dark_mode.dart';
import 'package:my_app/themes/light_mode.dart';
/*
  THEME PROVIDER 
  This will help us change the app dark & light mode
 */

class ThemeProvider with ChangeNotifier{
  // intially set it as light mode
  ThemeData _themeData = lightMode;

  // get the current theme
  ThemeData get themeData => _themeData;

  // is it dark mode currently?
  bool get isDarkMode => _themeData ==darkMode;

  //set the theme
  set themeData (ThemeData themeData){
    _themeData = themeData;

    // update UI
    notifyListeners();
  }
  // toggle between dark & light mode
  void toggleTheme(){
    if(_themeData == lightMode){
      themeData = darkMode;

    }else{
      themeData = lightMode;
    }
  }
}