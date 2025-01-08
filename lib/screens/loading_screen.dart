import 'package:climaa/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Location location = Location();

  void getLocation() async{
    await location.getLocation();
    print("User's location: ${location.latitude}, ${location.longitude}");
  }
  @override
  void initState()  {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {

    print('buil is called ');
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
