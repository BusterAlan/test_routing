import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnDeviceTrainingPage extends StatelessWidget {
  const OnDeviceTrainingPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Device"),
    ),
    body: Center(child: Text("On device training page")),
  );
}
