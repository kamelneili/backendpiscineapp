import 'package:eshopbackend/features/screens/signup/signup_screen.dart';
import 'package:eshopbackend/screens/clients/client_screen.dart';
import 'package:eshopbackend/screens/clients/list_clients/screens/listeclients_screen.dart';
import 'package:eshopbackend/screens/coachs/list_coachs/screens/liste_coachs_screen.dart';
import 'package:eshopbackend/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/SignupScreen':
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case '/loginScreen':
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case '/ProfileScreen':
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case '/clients':
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );
      case '/coachs':
        return MaterialPageRoute(
          builder: (_) => const CartCoachScreen(),
        );
    }
    return null;
  }
}
