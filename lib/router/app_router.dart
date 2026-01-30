import 'package:auto_route/auto_route.dart';
import 'package:test_routing/router/app_router.gr.dart';
import 'package:package_a/routes/package_a_router.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, path: "/"),
    AutoRoute(page: ProfileRoute.page, path: "/profile"),
    ...PackageARouter().routes,
  ];
}
