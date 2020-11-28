import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String city;
  final int temperature;
  final String description;
  final String icon;

  HomeScreen(
      {@required this.city,
      @required this.temperature,
      @required this.description,
      @required this.icon});

  @override
  Widget build(BuildContext context) {
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
              "$city",
              style: TextStyle(fontSize: 18.0, color: Color(0xFF777777)),
            ),
            Text(
              "$temperature°",
              style: TextStyle(
                fontSize: 64.0,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                color: Color(0xFF444444),
              ),
            ),
            Image(
              image: NetworkImage(icon),
            ),
            Text("$description"),
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
