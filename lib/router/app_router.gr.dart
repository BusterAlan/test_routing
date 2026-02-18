// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:test_routing/entities/weather_entity.dart' as _i10;
import 'package:test_routing/pages/account_balance_page.dart' as _i1;
import 'package:test_routing/pages/cable_page.dart' as _i2;
import 'package:test_routing/pages/login_page.dart' as _i4;
import 'package:test_routing/pages/navigation/dashboard_page.dart' as _i3;
import 'package:test_routing/pages/on_device_training_page.dart' as _i5;
import 'package:test_routing/pages/umbrella_page.dart' as _i6;
import 'package:test_routing/pages/weather_page.dart' as _i7;

/// generated route for
/// [_i1.AccountBalancePage]
class AccountBalanceRoute extends _i8.PageRouteInfo<void> {
  const AccountBalanceRoute({List<_i8.PageRouteInfo>? children})
    : super(AccountBalanceRoute.name, initialChildren: children);

  static const String name = 'AccountBalanceRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountBalancePage();
    },
  );
}

/// generated route for
/// [_i2.CablePage]
class CableRoute extends _i8.PageRouteInfo<void> {
  const CableRoute({List<_i8.PageRouteInfo>? children})
    : super(CableRoute.name, initialChildren: children);

  static const String name = 'CableRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.CablePage();
    },
  );
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute({List<_i8.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.DashboardPage();
    },
  );
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginPage();
    },
  );
}

/// generated route for
/// [_i5.OnDeviceTrainingPage]
class OnDeviceTrainingRoute extends _i8.PageRouteInfo<void> {
  const OnDeviceTrainingRoute({List<_i8.PageRouteInfo>? children})
    : super(OnDeviceTrainingRoute.name, initialChildren: children);

  static const String name = 'OnDeviceTrainingRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.OnDeviceTrainingPage();
    },
  );
}

/// generated route for
/// [_i6.UmbrellaPage]
class UmbrellaRoute extends _i8.PageRouteInfo<void> {
  const UmbrellaRoute({List<_i8.PageRouteInfo>? children})
    : super(UmbrellaRoute.name, initialChildren: children);

  static const String name = 'UmbrellaRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.UmbrellaPage();
    },
  );
}

/// generated route for
/// [_i7.WeatherPage]
class WeatherRoute extends _i8.PageRouteInfo<WeatherRouteArgs> {
  WeatherRoute({
    _i9.Key? key,
    required _i10.WeatherEntity entity,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         WeatherRoute.name,
         args: WeatherRouteArgs(key: key, entity: entity),
         initialChildren: children,
       );

  static const String name = 'WeatherRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WeatherRouteArgs>();
      return _i7.WeatherPage(key: args.key, entity: args.entity);
    },
  );
}

class WeatherRouteArgs {
  const WeatherRouteArgs({this.key, required this.entity});

  final _i9.Key? key;

  final _i10.WeatherEntity entity;

  @override
  String toString() {
    return 'WeatherRouteArgs{key: $key, entity: $entity}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WeatherRouteArgs) return false;
    return key == other.key && entity == other.entity;
  }

  @override
  int get hashCode => key.hashCode ^ entity.hashCode;
}
