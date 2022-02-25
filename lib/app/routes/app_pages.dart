import 'package:get/get.dart';
import 'package:just_weather/app/modules/favourites/bindings/favourites_binding.dart';
import 'package:just_weather/app/modules/favourites/views/favourites_view.dart';
import 'package:just_weather/app/modules/home/bindings/home_binding.dart';
import 'package:just_weather/app/modules/home/views/home_view.dart';

import '../modules/searchPlaces/bindings/searchPlaces_binding.dart';
import '../modules/searchPlaces/views/searchPlaces_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FAVOURITES,
      page: () => FavouritesView(),
      binding: FavouritesBinding(),
    ),
    GetPage(
      name: _Paths.FAVOURITES,
      page: () => searchPlacesView(),
      binding: searchPlacesBinding(),
    ),
  ];
}
