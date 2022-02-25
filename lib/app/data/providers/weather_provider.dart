import 'package:geolocator/geolocator.dart';
import 'package:just_weather/app/data/models/weather_current.dart';
import 'package:just_weather/app/data/models/weather_forecast.dart';
import 'package:just_weather/app/services/api.dart';

class WeatherProvider extends ApiConnect {
  /// Get users current location
  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  /// Get current weather details
  Future<WeatherCurrent> getWeather(Position? position) async {
    return WeatherCurrent.fromJson(await get(
      '/data/2.5/weather?lat=${position?.latitude}&lon=${position?.longitude}&appid=7843464504e0703571bf9bc1d218133c&units=metric',
    ).then((response) => response.body));
  }

  /// Get current weather details
  Future<WeatherForecast> getWeatherForecast(Position? position) async {
    return WeatherForecast.fromJson(await get(
      '/data/2.5/forecast?lat=${position?.latitude}&lon=${position?.longitude}&appid=7843464504e0703571bf9bc1d218133c&units=metric',
    ).then((response) => response.body));
  }

  getPlace() {}
}
