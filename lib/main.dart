import 'package:age_calculator_flutter/config/theme_pref.dart';
import 'package:age_calculator_flutter/config/theme_provider.dart';
import 'package:age_calculator_flutter/screen/home_screen.dart';
import 'package:age_calculator_flutter/screen/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
    [
    // SystemUiOverlay.bottom,//This line is used for showing the bottom bar
    //  SystemUiOverlay.top, // This line is used for showing the top bar,
    ],
  );
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
      home: LandingScreen(),
    );
  }
}
