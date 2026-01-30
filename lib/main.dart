import 'package:flutter/material.dart';
import 'package:test_routing/pages/login_page.dart';
import 'package:test_routing/pages/profile_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => const LoginPage(),
      "/home": (context) => const ProfilePage(),
    },
    initialRoute: "/",
  );
}
