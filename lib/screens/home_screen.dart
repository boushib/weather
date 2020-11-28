import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  static const route = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  bool _isInit = false;

  @override
  void didChangeDependencies() async {
    if (!_isInit) {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Weather>(context).getWeather();
      setState(() {
        _isLoading = false;
      });
    }
    _isInit = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _weather = Provider.of<Weather>(context).weather;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _isLoading
              ? SpinKitThreeBounce(color: Colors.green, size: 32.0)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _weather.city,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF777777),
                      ),
                    ),
                    Text(
                      "${_weather.temperature}°",
                      style: TextStyle(
                        fontSize: 64.0,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF444444),
                      ),
                    ),
                    Image.network(_weather.icon),
                    Text(_weather.description),
                    FlatButton(
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          color: Color(0xFF999999),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, SettingsScreen.route);
                      },
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
