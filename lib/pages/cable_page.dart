import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CablePage extends StatelessWidget {
  const CablePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Cable"),
    ),
    body: Center(child: Text("Cable page")),
  );
}
