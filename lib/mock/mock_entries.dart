import 'package:test_routing/entities/weather_entity.dart';

class MockEntries {
  static WeatherEntity sunnyLocalCase = WeatherEntity(
    cityName: "Monterrey",
    temperatureCelsius: 22,
    windSpeedKph: 10,
    humidityPercent: 30,
    condition: Condition.sunny,
    lastUpdated: DateTime.now(),
  );

  static WeatherEntity cloudyCase = WeatherEntity(
    cityName: "Seattle",
    temperatureCelsius: 15.5,
    windSpeedKph: 8.2,
    humidityPercent: 82,
    condition: Condition.cloudy,
    lastUpdated: DateTime.now().subtract(Duration(minutes: 45)),
  );

  static WeatherEntity rainyCase = WeatherEntity(
    cityName: "Quito",
    temperatureCelsius: 12.3,
    windSpeedKph: 18.7,
    humidityPercent: 92,
    condition: Condition.rainy,
    lastUpdated: DateTime.now().subtract(Duration(hours: 2, minutes: 10)),
  );
}
