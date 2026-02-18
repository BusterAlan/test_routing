import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_routing/mock/mock_entries.dart';
import 'package:test_routing/router/app_router.gr.dart';

@RoutePage()
class AccountBalancePage extends StatelessWidget {
  const AccountBalancePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Account")),
    body: Center(child: Text("Account balance page")),
    floatingActionButton: FloatingActionButton(
      heroTag: "my_tag",
      onPressed: () => _onPressed(context),
      child: Icon(Icons.sunny),
    ),
  );

  void _onPressed(BuildContext context) {
    context.router.push(WeatherRoute(entity: MockEntries.rainyCase));
  }
}
