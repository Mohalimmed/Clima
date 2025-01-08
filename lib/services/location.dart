
import 'package:geolocator/geolocator.dart';

class Location {

 double? latitude;
 double? longitude;

  Location({this.latitude, this.longitude});
  Future<void> getLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are permanently denied
        print('Location permissions are permanently denied. Please enable them in settings.');
        Geolocator.openAppSettings(); // Optionally, navigate the user to app settings
        return;
      }

      // If permissions are granted, get the location
      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.low,
        distanceFilter: 100,
      );

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      latitude = await position.latitude;
      longitude = await position.longitude;
    } catch (e) {
      print('Error while getting location: $e');
    }
  }
}