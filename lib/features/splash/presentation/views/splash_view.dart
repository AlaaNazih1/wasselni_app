import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wasselni/core/routes/app_routes.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
     
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset('assets/images/splash_screen.png', fit: BoxFit.cover),

          // Optional dark overlay
          Container(color: Colors.black.withValues(alpha: 0.15)),

          // Loading Indicator
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: const Center(
              child: SizedBox(
                width: 45,
                height: 45,
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFD000)),
                  backgroundColor: Colors.white54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
