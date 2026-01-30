import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../views/views.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late int _currentIndex;

  @override
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Profile page"),
      actions: [
        IconButton(
          onPressed: _onIconButtonPressed,
          icon: Icon(Icons.info_rounded),
        ),
      ],
    ),
    body: _bodySolver(),
    bottomNavigationBar: BottomNavigationBar(
      fixedColor: Colors.red,
      unselectedItemColor: Colors.amber,
      currentIndex: _currentIndex,
      onTap: _onTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_rounded),
          label: "account_balance_rounded",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.cable_rounded),
          label: "cable_rounded",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.umbrella_rounded),
          label: "umbrella_rounded",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.on_device_training_rounded),
          label: "on_device_training_rounded",
        ),
      ],
    ),
  );

  void _onTap(int value) => setState(() => _currentIndex = value);

  Widget _bodySolver() {
    return switch (_currentIndex) {
      0 => AccountBalanceView(),
      1 => CableView(),
      2 => UmbrellaView(),
      3 => OnDeviceTrainingView(),
      _ => throw Exception("Invalid index"),
    };
  }

  void _onIconButtonPressed() => showAboutDialog(context: context);
}
