import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uts_ari_mobile_programming/constants.dart';

class WeatherService {
  Future<Map<String, dynamic>> fetchWeatherDataByCoordinates(double latitude, double longitude) async {
    final url =
        '${Constants.baseUrl}/weather?lat=$latitude&lon=$longitude&appid=${Constants.apiKey}&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }
}
