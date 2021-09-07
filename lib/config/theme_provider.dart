import 'package:age_calculator_flutter/config/theme_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  bool _darkTheme = false;
  ThemePreference preference = ThemePreference();

  
  bool get darkTheme => _darkTheme;


  set setTheme(bool value) {
    _darkTheme = value;
    preference.setTheme(value);
    notifyListeners();
  }
}
