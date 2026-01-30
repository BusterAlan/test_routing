import 'package:flutter/material.dart';
import 'package:package_a/pages/home_page.dart';

class UmbrellaView extends StatelessWidget {
  const UmbrellaView({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: OutlinedButton(
      onPressed: () => _onPressed(context),
      child: Text("Go to package"),
    ),
  );

  void _onPressed(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
