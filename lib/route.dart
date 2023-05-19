import 'package:alerts/registration.dart';
import 'package:flutter/material.dart';

import 'category.dart';
import 'history.dart';
import 'home.dart';
import 'login.dart';
import 'main.dart';

class AppRoutes {
  static const String authWrapper = '/';
  static const String login = '/login';
  static const String registration = '/registration';
  static const String home = '/home';
  static const String category = '/category';
  static const String history = '/history';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authWrapper:
        return MaterialPageRoute(builder: (_) => const AuthWrapper());
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case registration:
        return MaterialPageRoute(builder: (_) => RegistrationPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case category:
        return MaterialPageRoute(builder: (_) => const CategoryPage());
      case history:
        return MaterialPageRoute(
            builder: (_) => HistoryPage(purchaseTracker: purchaseTracker));
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Found'),
      ),
      body: const Center(
        child: Text('Page not found.'),
      ),
    );
  }
}
