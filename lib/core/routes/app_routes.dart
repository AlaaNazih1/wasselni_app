import 'package:flutter/material.dart';
import 'package:wasselni/features/authentication/presentation/views/login_view.dart';

class AppRoutes {
  static const String login = '/login';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginView(),
  };
}
