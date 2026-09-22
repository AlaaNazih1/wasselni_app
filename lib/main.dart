import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wasselni/core/routes/app_routes.dart';
import 'package:wasselni/firebase_options.dart';

import 'core/theme/app_colors.dart';
import 'features/splash/presentation/views/splash_view.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const WasselniApp());
}

class WasselniApp extends StatelessWidget {
  const WasselniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      title: 'Wasselni',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.white,
      ),
      home: const SplashView(),
    );
  }
}
