import 'package:age_calculator_flutter/config/theme_pref.dart';
import 'package:age_calculator_flutter/config/theme_provider.dart';
import 'package:age_calculator_flutter/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeProvider = ThemeProvider();
  void getCurrentTheme() async {
//  themeProvider.darkTheme = await themeProvider.preference.getTheme();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
