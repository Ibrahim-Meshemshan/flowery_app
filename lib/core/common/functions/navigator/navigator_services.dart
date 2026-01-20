import 'package:flutter/material.dart';

/// Global navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// Helper class to perform navigation from anywhere
class NavigatorService {
  NavigatorService._(); // prevent instantiation

  /// Push widget (MaterialPageRoute)
  static Future<T?> push<T extends Object?>(Widget page) {
    return navigatorKey.currentState!.push<T>(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Push named route
  static Future<T?> pushNamed<T extends Object?>(
      String routeName, {
        Object? arguments,
      }) {
    return navigatorKey.currentState!.pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  /// Push replacement widget
  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
      Widget page,
      ) {
    return navigatorKey.currentState!.pushReplacement<T, TO>(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Push replacement named route
  static Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
      String routeName, {
        Object? arguments,
      }) {
    return navigatorKey.currentState!.pushReplacementNamed<T, TO>(
      routeName,
      arguments: arguments,
    );
  }

  /// Push named and remove all previous routes
  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
      String routeName, {
        Object? arguments,
      }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil<T>(
      routeName,
          (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  /// Push widget and remove all previous routes
  static Future<T?> pushAndRemoveUntil<T extends Object?>(
      Widget page,
      ) {
    return navigatorKey.currentState!.pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (_) => page),
          (Route<dynamic> route) => false,
    );
  }

  /// Pop current route
  static void pop<T extends Object?>([T? result]) {
    navigatorKey.currentState!.pop(result);
  }

  /// Pop until first route
  static void popUntilFirst() {
    navigatorKey.currentState!
        .popUntil((Route<dynamic> route) => route.isFirst);
  }
}
