import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkHelper{
  String? lon;
  String? lat;

  NetworkHelper({ this.lon,  this.lat,});

  Future getLocationData() async {
    // Separate the hostname and path, and use query parameters.
    var url = Uri.https(
      'api.weatherstack.com', // Hostname
      '/current', // Path
      {
        'query': '$lat,$lon', // Query parameters as key-value pairs
        'access_key': '6c541d70b2a1684f3166b9c582a1b6af',
      },
    );
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = response.body;
      return jsonDecode(data);
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  }
  Future getCityData(String? cityName) async {
    // Separate the hostname and path, and use query parameters.
    var url = Uri.https(
      'api.weatherstack.com', // Hostname
      '/current', // Path
      {
        'query': '$cityName', // Query parameters as key-value pairs
        'access_key': '',
      },
    );
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = response.body;
      return jsonDecode(data);
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  }

// var description = data['current']['weather_descriptions'][0];
// print(description);
}