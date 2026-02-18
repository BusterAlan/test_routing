import 'package:equatable/equatable.dart';

enum Condition {
  sunny,
  cloudy,
  rainy,
}

class WeatherEntity extends Equatable {
  final String cityName;
  final double temperatureCelsius;
  final double windSpeedKph;
  final int humidityPercent;
  final Condition condition;
  final DateTime lastUpdated;

  const WeatherEntity({required this.cityName, required this.temperatureCelsius, required this.windSpeedKph, required this.humidityPercent, required this.condition, required this.lastUpdated});
  
  @override
  List<Object?> get props => [
    cityName,
    temperatureCelsius,
    windSpeedKph,
    humidityPercent,
    condition,
    lastUpdated,
  ];
}
