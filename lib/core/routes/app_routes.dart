import 'package:flutter/material.dart';
import 'package:wasselni/features/authentication/presentation/views/login_view.dart';
import 'package:wasselni/features/authentication/presentation/views/register_view.dart';
import 'package:wasselni/features/create_order/presentation/views/create_order_view.dart';
import 'package:wasselni/features/tracking/presentation/views/tracking_view.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String myOrders = '/my-orders';
  static const String createOrder = '/create-order';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginView(),
    register:(context) => const RegisterView(),
    myOrders:(context) => const TrackingView(),
    createOrder:(context) => const CreateOrderView(),
  };
}
