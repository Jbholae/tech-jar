import 'package:flutter/material.dart';
import 'package:tech_jar/config/app_routes.dart';
import 'package:tech_jar/config/route_arguments.dart';
import 'package:tech_jar/view/detail_screen.dart';
import 'package:tech_jar/view/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return buildRoute(
          const HomeScreen(),
          settings: settings,
        );
      case AppRoutes.postDetail:
        final arguments = settings.arguments as PostDetailArgument;
        return buildRoute(
          PostDetailScreen(
            arguments: arguments,
          ),
          settings: settings,
        );
      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute buildRoute(Widget child,
      {required RouteSettings settings}) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => child,
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Error Route'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              "Seems like the route you've navigated to doesn't exist !!!",
              style: TextStyle(
                color: Color(0xffFF4C5E),
                fontSize: 42,
              ),
            ),
          ),
        ),
      );
    });
  }
}
