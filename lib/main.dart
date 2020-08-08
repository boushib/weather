import 'package:flutter/material.dart';
import './views/settings.dart';
import './views/home.dart';
import './views/welcome.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => WelcomePage(),
        "/home": (context) => HomePage(),
        "/settings": (context) => SettingsPage(),
      },
    );
  }
}
