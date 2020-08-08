import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('settings page destroyed!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://images.pexels.com/photos/917494/pexels-photo-917494.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter location..',
                  filled: true,
                  fillColor: Color.fromRGBO(255, 255, 255, .4),
                ),
                onChanged: (value){
                  print(value);
                },
              ),
              RaisedButton(
                child: Text("Save location"),
                onPressed: () {
                  print('saving location...');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
