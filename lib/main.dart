import 'package:flutter/material.dart';
import 'package:weather/screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      routes: {
        WelcomeScreen.route: (_) => WelcomeScreen(),
        HomeScreen.route: (_) => HomeScreen(),
        SettingsScreen.route: (_) => SettingsScreen(),
      },
    );
  }
}
