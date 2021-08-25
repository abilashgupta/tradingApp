// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/dashboard/dashboard_view.dart';
import '../ui/form/form_view.dart';
import '../ui/login/login_view.dart';
import '../ui/marketWatch/marketwatch_view.dart';
import '../ui/orders/orders_view.dart';
import '../ui/profile/profile_view.dart';

class Routes {
  static const String login = '/';
  static const String dashboard = '/Dashboard';
  static const String orders = '/Orders';
  static const String profile = '/Profile';
  static const String marketWatch = '/market-watch';
  static const String formOrder = '/form-order';
  static const all = <String>{
    login,
    dashboard,
    orders,
    profile,
    marketWatch,
    formOrder,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.login, page: Login),
    RouteDef(Routes.dashboard, page: Dashboard),
    RouteDef(Routes.orders, page: Orders),
    RouteDef(Routes.profile, page: Profile),
    RouteDef(Routes.marketWatch, page: MarketWatch),
    RouteDef(Routes.formOrder, page: FormOrder),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    Login: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const Login(),
        settings: data,
      );
    },
    Dashboard: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const Dashboard(),
        settings: data,
      );
    },
    Orders: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Orders(
          list: {},
          orderPrice: 0,
          orderType: '',
          quantity: 0,
        ),
        settings: data,
      );
    },
    Profile: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const Profile(),
        settings: data,
      );
    },
    MarketWatch: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MarketWatch(),
        settings: data,
      );
    },
    FormOrder: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => FormOrder(
          list: {},
          orderType: '',
        ),
        settings: data,
      );
    },
  };
}
