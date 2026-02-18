import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_routing/entities/weather_entity.dart';

@RoutePage()
class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key, required this.entity});

  final WeatherEntity entity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather page")),
      body: Stack(
        children: [
          Center(
            child: Icon(
              _icon(entity.condition),
              size: 256,
              color: Colors.blueGrey.withValues(alpha: 0.12),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 24,
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                entity.cityName,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _conditionText(entity.condition),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(_icon(entity.condition), size: 36),
                            const SizedBox(width: 8),
                            Text(
                              '${entity.temperatureCelsius.toStringAsFixed(1)}°C',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.air, size: 18),
                            const SizedBox(width: 6),
                            Text(
                              '${entity.windSpeedKph.toStringAsFixed(1)} kph',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.opacity, size: 18),
                            const SizedBox(width: 6),
                            Text('${entity.humidityPercent}%'),
                          ],
                        ),
                        Text(
                          'Updated ${_formatDateTime(entity.lastUpdated)}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _conditionText(Condition condition) => switch (condition) {
    Condition.sunny => 'Sunny',
    Condition.cloudy => 'Cloudy',
    Condition.rainy => 'Rainy',
  };

  String _formatDateTime(DateTime dt) {
    final local = dt.toLocal();
    String twoDigit(int n) => n.toString().padLeft(2, '0');
    return '${local.day}/${local.month}/${local.year} ${twoDigit(local.hour)}:${twoDigit(local.minute)}';
  }

  IconData _icon(Condition condition) => switch (condition) {
    Condition.sunny => Icons.sunny,
    Condition.cloudy => Icons.wb_cloudy,
    Condition.rainy => Icons.cloudy_snowing,
  };
}
