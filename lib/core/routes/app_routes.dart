import 'package:flutter/material.dart';
import 'package:wasselni/features/authentication/presentation/views/login_view.dart';
import 'package:wasselni/features/authentication/presentation/views/register_view.dart';
import 'package:wasselni/features/orders/presentation/views/my_orders_view.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String myOrders = '/my-orders';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginView(),
    register:(context) => const RegisterView(),
    myOrders:(context) => const MyOrdersView(),
  };
}
