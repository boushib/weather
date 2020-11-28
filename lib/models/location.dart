import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation(context) async {
    try {
      Position location = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = location.latitude;
      longitude = location.longitude;
    } catch(err){
      print("Error happened: $err");
    }
  }
}