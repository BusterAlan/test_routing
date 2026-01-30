import 'package:flutter/material.dart';
import 'package:test_routing/pages/profile_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _controllerUsername;
  late TextEditingController _controllerPassword;

  @override
  void initState() {
    super.initState();
    _controllerUsername = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: .spaceEvenly,
        children: [
          TextField(
            decoration: InputDecoration(hintText: "username"),
            controller: _controllerUsername,
          ),
          TextField(
            decoration: InputDecoration(hintText: "password"),
            controller: _controllerPassword,
            obscureText: true,
          ),
          FilledButton(onPressed: _onPressed, child: Text("Send")),
        ],
      ),
    ),
  );

  void _onPressed() {
    if (_controllerUsername.text.isEmpty || _controllerPassword.text.isEmpty) {
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }
}
