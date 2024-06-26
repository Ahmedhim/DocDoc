// appRouting

import 'package:docdoc_project/core/routing/routes.dart';
import 'package:docdoc_project/features/home/view/home.dart';
import 'package:docdoc_project/features/login/view/login.dart';
import 'package:docdoc_project/features/onboarding/view/onboading.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.boardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboadingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text('Page not found')),
                ));
    }
  }
}
