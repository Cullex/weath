import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_weather/app/config/theme.dart';
import 'package:just_weather/app/data/models/weather_forecast.dart';
import 'package:just_weather/app/extensions/index.dart';
import 'package:just_weather/app/modules/home/controllers/home_controller.dart';
import 'package:just_weather/app/widgets/alert_widget.dart';
import 'package:mdi/mdi.dart';
import 'package:weather_icons/weather_icons.dart';

class HomeBody extends GetView<HomeController> {
  const HomeBody({
    Key? key,
    required this.backgroundImage,
    required this.skyObjectPosition,
    required this.skyObjectColor,
    Alignment? backgroundPosition,
    double? skyObjectOpacity,
    List<Widget>? children,
  })  : _backgroundPosition = backgroundPosition ?? Alignment.center,
        skyObjectOpacity = 0.85,
        children = const [],
        super(key: key);

  final String backgroundImage;
  final Alignment skyObjectPosition, _backgroundPosition;
  final Color skyObjectColor;
  final double skyObjectOpacity;
  final List<Widget> children;

  get weather => controller.weather;

  get forecast => controller.forecast;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Image.asset(
              backgroundImage,
              height: Get.height,
              width: Get.width,
              fit: BoxFit.cover,
              alignment: _backgroundPosition,
            ),
            Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                  ],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
            Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: skyObjectPosition,
                  colors: [
                    skyObjectColor.withOpacity(skyObjectOpacity),
                    skyObjectColor.withOpacity(skyObjectOpacity),
                    skyObjectColor.withOpacity(0.1),
                    Colors.black12.withOpacity(0.025),
                    Colors.black.withOpacity(0.25),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: ListTile(
                  leading: Icon(
                    Icons.cloud,
                    size: 40,
                  ),
                  iconColor: Colors.white,
                  title: Text(
                    'DVT Just Weather App',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Weather Services For You',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () => print('onTap Action'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      if (weather == null)
                        ElevatedButton.icon(
                          icon: Icon(Mdi.refresh),
                          onPressed: controller.load,
                          label: Text('Press To Refresh'),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white30),
                          ),
                        ),
                      if (weather != null)
                        ListTile(
                          title: Text('${weather?.name}',
                              style: AppTheme.textTitle),
                          subtitle: Text('${weather?.main.temp} °C',
                              style: AppTheme.textTitle),
                          leading: Icon(Mdi.mapMarkerCircle,
                              size: 63, color: Colors.white70),
                        ),
                      SizedBox(height: 16),
                      Expanded(
                        child: ClipRect(
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: WeatherCard(children: children),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                height: Get.height * 0.65,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherCard extends GetView<HomeController> {
  const WeatherCard({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  get weather => controller.weather;

  get forecast => controller.forecast;

  get forecastRest =>
      controller.forecast?.list
          .map((e) => e.dateTime?.weekday)
          .toSet()
          .map((e) => controller.forecast?.list
              .firstWhere((element) => element.dateTime?.weekday == e))
          .toList() ??
      [];

  icon(Weather details) {
    switch (details.icon) {
      case '10n':
      case '10d':
        return WeatherIcons.day_rain;
      case '01n':
      case '01d':
        return WeatherIcons.day_sunny;
      case '02n':
      case '02d':
      case '03n':
        return WeatherIcons.day_cloudy_gusts;

      default:
        return WeatherIcons.celsius;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (weather == null)
      return Alert.warning(
          message: 'Internet connection failed, please try again');

    return ListView(
      children: [
        ...children,
        for (WeatherDetails weather in forecastRest) ...[
          ListTile(
            dense: true,
            isThreeLine: true,
            leading:
                BoxedIcon(icon(weather.weather.first), color: Colors.white60),
            title: Text(
              DateTime.now().day == weather.dateTime?.day
                  ? 'Today'
                  : '${weather.dateTime?.day}, ${weather.dateTime?.weekdayName}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: DateTime.now().day == weather.dateTime?.day
                    ? FontWeight.bold
                    : FontWeight.w100,
              ),
            ),
            subtitle: Text(
              '${weather.weather.first.main}, ${weather.weather.first.description}\n'
              'Wind speed, ${weather.wind.speed} m/s \n'
              'Humidity, ${weather.main.humidity} %',
              style: TextStyle(
                  color: Colors.white60,
                  fontSize:
                      DateTime.now().day == weather.dateTime?.day ? 18 : 12),
            ),
          ),
          Divider(height: 20, color: Colors.white10),
        ]
      ],
    );
  }
}
