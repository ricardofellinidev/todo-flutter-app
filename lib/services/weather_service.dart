import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String baseUrl = "http://api.openweathermap.org/data/2.5/weather";
  final String apiKey = "b7cfc1ec37396c4ac2b9e4c4c5816111";

  Future<dynamic> getWeather(double lat, double lon) async {
    final url =
        "$baseUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric&lang=pt_br";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Falha ao carregar o tempo, por favor verifique o serviço de tempo.');
    }
  }
}
