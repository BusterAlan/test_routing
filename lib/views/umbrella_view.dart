import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:package_a/routes/package_a_router.gr.dart';

class UmbrellaView extends StatelessWidget {
  const UmbrellaView({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: OutlinedButton(
      onPressed: () => _onPressed(context),
      child: Text("Go to package"),
    ),
  );

  void _onPressed(BuildContext context) => context.router.push(
    const HomeRoute()
  );
}
