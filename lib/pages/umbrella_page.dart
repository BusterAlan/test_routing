import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:package_a/routes/package_a_router.gr.dart';

@RoutePage()
class UmbrellaPage extends StatelessWidget {
  const UmbrellaPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Umbrella"),
    ),
    body: Center(
    child: OutlinedButton(
      onPressed: () => _onPressed(context),
      child: Text("Go to package"),
    ),
  ),
  );

  void _onPressed(BuildContext context) => context.router.push(
    const HomeRoute()
  );
}
