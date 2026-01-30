import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_routing/router/app_router.gr.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) => AutoTabsRouter.tabBar(
    routes: [
      AccountBalanceRoute(),
      CableRoute(),
      UmbrellaRoute(),
      OnDeviceTrainingRoute(),
    ],
    builder: (context, child, tabController) {
      final tabsRouter = AutoTabsRouter.of(context);
      return Scaffold(
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.red,
          unselectedItemColor: Colors.amber,
          currentIndex: tabsRouter.activeIndex,
          onTap: (value) => tabsRouter.setActiveIndex(value),
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
    },
  );
}
