class WeatherForecast {
  WeatherForecast({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  late final String cod;
  late final message;
  late final cnt;
  late final List<WeatherDetails> list;
  late final City city;

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    list =
        List.from(json['list']).map((e) => WeatherDetails.fromJson(e)).toList();
    city = City.fromJson(json['city']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cod'] = cod;
    _data['message'] = message;
    _data['cnt'] = cnt;
    _data['list'] = list.map((e) => e.toJson()).toList();
    _data['city'] = city.toJson();
    return _data;
  }
}

class WeatherDetails {
  WeatherDetails({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
  });

  late final dt;
  late final Main main;
  late final List<Weather> weather;
  late final Clouds clouds;
  late final Wind wind;
  late final visibility;
  late final pop;
  late final Sys sys;
  late final String dtTxt;
  late DateTime? dateTime;

  WeatherDetails.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = Main.fromJson(json['main']);
    weather =
        List.from(json['weather']).map((e) => Weather.fromJson(e)).toList();
    clouds = Clouds.fromJson(json['clouds']);
    wind = Wind.fromJson(json['wind']);
    visibility = json['visibility'];
    pop = json['pop'];
    sys = Sys.fromJson(json['sys']);
    dtTxt = json['dt_txt'];
    dateTime = DateTime.tryParse(json['dt_txt']);
  }


  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['main'] = main.toJson();
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    _data['clouds'] = clouds.toJson();
    _data['wind'] = wind.toJson();
    _data['visibility'] = visibility;
    _data['pop'] = pop;
    _data['sys'] = sys.toJson();
    _data['dt_txt'] = dtTxt;
    return _data;
  }
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  late final temp;
  late final feelsLike;
  late final tempMin;
  late final tempMax;
  late final pressure;
  late final seaLevel;
  late final grndLevel;
  late final humidity;
  late final tempKf;

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
    humidity = json['humidity'];
    tempKf = json['temp_kf'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['temp'] = temp;
    _data['feels_like'] = feelsLike;
    _data['temp_min'] = tempMin;
    _data['temp_max'] = tempMax;
    _data['pressure'] = pressure;
    _data['sea_level'] = seaLevel;
    _data['grnd_level'] = grndLevel;
    _data['humidity'] = humidity;
    _data['temp_kf'] = tempKf;
    return _data;
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  late final id;
  late final String main;
  late final String description;
  late final String icon;

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['main'] = main;
    _data['description'] = description;
    _data['icon'] = icon;
    return _data;
  }
}

class Clouds {
  Clouds({
    required this.all,
  });

  late final all;

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['all'] = all;
    return _data;
  }
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  late final speed;
  late final deg;
  late final gust;

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['speed'] = speed;
    _data['deg'] = deg;
    _data['gust'] = gust;
    return _data;
  }
}

class Sys {
  Sys({
    required this.pod,
  });

  late final String pod;

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pod'] = pod;
    return _data;
  }
}

class City {
  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  late final id;
  late final String name;
  late final Coord coord;
  late final String country;
  late final population;
  late final timezone;
  late final sunrise;
  late final sunset;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = Coord.fromJson(json['coord']);
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['coord'] = coord.toJson();
    _data['country'] = country;
    _data['population'] = population;
    _data['timezone'] = timezone;
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    return _data;
  }
}

class Coord {
  Coord({
    required this.lat,
    required this.lon,
  });

  late final lat;
  late final lon;

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['lon'] = lon;
    return _data;
  }
}
