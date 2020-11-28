import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'home';
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> _weatherData =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _weatherData['city'],
              style: TextStyle(fontSize: 18.0, color: Color(0xFF777777)),
            ),
            Text(
              "${_weatherData['temperature']}°",
              style: TextStyle(
                fontSize: 64.0,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                color: Color(0xFF444444),
              ),
            ),
            Image(
              image: NetworkImage(_weatherData['icon']),
            ),
            Text(_weatherData['description']),
            FlatButton(
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Color(0xFF999999),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/settings");
              },
            )
          ],
        ),
      ),
    );
  }
}
