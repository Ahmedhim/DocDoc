import 'package:flutter/material.dart';

extension DoubleOperations on double {
  Widget get vrSpace => SizedBox(
        width: this,
      );
  Widget get hrSpace => SizedBox(
        height: this,
      );
}

extension NavigationExtension on BuildContext {

  Future<dynamic>pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic>pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic>pushNamedAndRemoveUntil(String routeName, {Object? arguments,required RoutePredicate predicate}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }
  void pop() =>
    Navigator.of(this).pop();
  }

