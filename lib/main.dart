import 'package:flutter/material.dart';

import 'core/theme/app_colors.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const WasselniApp());
}

class WasselniApp extends StatelessWidget {
  const WasselniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wasselni',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.white,
      ),
      home: const SplashView(),
    );
  }
}
