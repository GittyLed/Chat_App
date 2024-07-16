import 'package:chat_app/theme/dark_mode.dart';

import '../theme/light_mode.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;
  bool get isDarkMode  => _themeData == darkMode;

  void updateThemeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toogleTheme(){
    if(themeData == lightMode){
      updateThemeData(darkMode);
    }
    else{
      updateThemeData(lightMode);
    }
  }
}