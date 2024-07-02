// appRouting

import 'package:docdoc_project/core/di/dependenacy_injection.dart';
import 'package:docdoc_project/core/routing/routes.dart';
import 'package:docdoc_project/features/home/view/home_screen.dart';
import 'package:docdoc_project/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc_project/features/login/ui/view/login_screen.dart';
import 'package:docdoc_project/features/onboarding/ui/view/onboarding_screen.dart';
import 'package:docdoc_project/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:docdoc_project/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.boardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboadingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
                  case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SignUpCubit>(),
                  child: const SignUpScreen(),
                ));


      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text('Page not found')),
                ));
    }
  }
}
