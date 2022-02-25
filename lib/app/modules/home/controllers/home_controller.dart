import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:just_weather/app/data/models/weather_current.dart';
import 'package:just_weather/app/data/models/weather_forecast.dart';
import 'package:just_weather/app/data/providers/weather_provider.dart';
import 'package:just_weather/app/data/state/mixins/dynamic_state_mixin.dart';
import 'package:just_weather/app/extensions/index.dart';

class HomeController extends GetxController with DynamicStateMixin {
  final provider = WeatherProvider();

  Position? get location => as('location');

  WeatherCurrent? get weather => as('weather');

  WeatherForecast? get forecast => as('forecast');

  Map<String, dynamic> get dayConfig {
    var hour = DateTime.now().hour;

    if (hour.isBetween(5, 12)) {
      return {
        'backgroundImage': 'assets/images/dawn.webp',
        'skyObjectColor': Colors.yellow.withBlue(160),
        'skyObjectPosition': Alignment(-1, -0.25),
      };
    }

    if (hour.isBetween(12, 16)) {
      return {
        'backgroundImage': 'assets/images/afternoon.webp',
        'skyObjectColor': Colors.yellowAccent,
        'backgroundPosition': Alignment(-0.5, 0),
        'skyObjectPosition': Alignment(0.9, -0.75),
      };
    }

    if (hour.isBetween(16, 19)) {
      return {
        'backgroundImage': 'assets/images/dusk.webp',
        'skyObjectColor': Colors.grey.shade100,
        'skyObjectPosition': Alignment(0.4, -0.75),
      };
    }

    return {
      'backgroundImage': 'assets/images/evening.webp',
      'skyObjectColor': Colors.blueAccent.shade100,
      'backgroundPosition': Alignment(-0.5, 0),
      'skyObjectPosition': Alignment((hour / 6), (hour / 6) * -1),
    };
  }

  @override
  void onInit() {
    super.onInit();

    load();
  }

  void load() {
    useLoading(() async {
      put('location', await provider.getLocation());
      put('weather', await provider.getWeather(location));
      put('forecast', await provider.getWeatherForecast(location));
    });
  }
}
