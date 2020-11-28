import 'package:flutter/material.dart';
import 'screens/settings_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => WelcomeScreen(),
        "/home": (context) => WelcomeScreen(),
        "/settings": (context) => SettingsScreen(),
      },
    );
  }
}
