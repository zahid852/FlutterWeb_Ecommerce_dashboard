import 'package:ecomerce_web/Presentation/RenderScreen/render_screen.dart';
import 'package:ecomerce_web/Presentation/resources/string_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class routes {
  static const String dashboard = '/dashboard';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case routes.dashboard:
        return MaterialPageRoute(builder: (ctx) => RenderScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRecordFound),
              ),
              body: Center(
                child: Container(
                  child: Text(AppStrings.noRecordFound),
                ),
              ),
            )));
  }
}
