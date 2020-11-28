import 'package:flutter/material.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Weather()),
    ],
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        HomeScreen.route: (_) => HomeScreen(),
        SettingsScreen.route: (_) => SettingsScreen(),
      },
    );
  }
}
