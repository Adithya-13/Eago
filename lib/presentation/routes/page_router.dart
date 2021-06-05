import 'package:eago_app/presentation/pages/pages.dart';
import 'package:eago_app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class PageRouter {
  final RouteObserver<PageRoute> routeObserver;

  PageRouter() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings){
    final args = settings.arguments as ArgumentBundle;
    switch(settings.name){
      case PagePath.splash: return _buildRoute(settings, SplashPage());
      case PagePath.onBoard: return _buildRoute(settings, OnBoardPage());
      case PagePath.dashboard: return _buildRoute(settings, DashboardPage());
      case PagePath.detail: return _buildRoute(settings, DetailPage());
      default: return _errorRoute();
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
