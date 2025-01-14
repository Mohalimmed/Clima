import 'package:climaa/screens/city_screen.dart';
import 'package:climaa/services/networking.dart';
import 'package:climaa/services/weather.dart';
import 'package:climaa/utilities/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final weatherData;

  const LocationScreen({super.key, this.weatherData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  String? description;
  String? country;
  String? name;
  String? temp;
  int? temperature;
  var weatherIcons;

  @override
  void initState() {
    super.initState();
    getUpdate(widget.weatherData);
  }

  void getUpdate(dynamic weatherData) {
    setState(() {
      description = weatherData['current']['weather_descriptions'][0];
      country = weatherData['location']['country'];
      name = weatherData['location']['name'];
      temperature = weatherData['current']['temperature'];
      temp = weatherModel.getMessage(temperature!);
      int weatherIcon = weatherData['current']['weather_code'];
      weatherIcons = weatherModel.getWeatherIcon(weatherIcon);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      var typeName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CityScreen(),
                          ));
                      if (typeName != null) {
                        NetworkHelper networkHelper = NetworkHelper();
                        var weatherData =
                            await networkHelper.getCityData(typeName);
                        getUpdate(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcons',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Text(description ?? 'unknown' ,style: kButtonTextStyle,textAlign: TextAlign.center,),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$temp in $name",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
