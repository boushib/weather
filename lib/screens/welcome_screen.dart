import 'package:flutter/material.dart';
import 'package:weather/screens/home_screen.dart';
import 'package:weather/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const api_key = '2a5ee69923e0258a4dbeebd8546ff675';

class WelcomeScreen extends StatefulWidget {
  static const route = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation(context);
    double latitude = location.latitude;
    double longitude = location.longitude;

    try {
      String url =
          "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api_key&units=metric";
      var res = await http.get(url);

      var data = jsonDecode(res.body);
      String city = data["name"];
      String description = data["weather"][0]["description"];
      int condition = data["weather"][0]["id"];
      int temperature = data["main"]["temp"].round();
      String icon = "http://openweathermap.org/img/wn/" +
          codeToIcon(condition) +
          "d@2x.png";
      Navigator.pushNamed(context, HomeScreen.route, arguments: {
        'city': city,
        'temperature': temperature,
        'description': description,
        'icon': icon,
      });
    } catch (err) {
      print("ERROR: $err");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitThreeBounce(
            color: Colors.green,
            size: 32.0,
          ),
        ),
      ),
    );
  }
}

String codeToIcon(code) {
  if (code == 800)
    return '01';
  else if (code == 801)
    return '02';
  else if (code == 802)
    return '03';
  else if (code == 803 || code == 804)
    return '04';
  else if (code >= 200 && code <= 232)
    return '11';
  else if ((code >= 300 && code <= 321) || (code >= 520 && code <= 531))
    return '09';
  else if (code >= 500 && code <= 504)
    return '10';
  else if (code == 511 || (code >= 600 && code <= 622))
    return '13';
  else if (code >= 701 && code <= 781)
    return '50';
  else
    return 'some error happened!';
}
