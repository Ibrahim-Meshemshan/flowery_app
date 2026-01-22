import 'package:flowery/core/route/routes_names.dart';
import 'package:flowery/feature/auth/presentation/ui/login/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../../feature/auth/presentation/ui/forget_password/forget_password_screen.dart';
import '../../feature/auth/presentation/ui/register/screens/register_screen.dart';
import '../../feature/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RoutesNames.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RoutesNames.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case RoutesNames.forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
