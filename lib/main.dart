import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasselni/core/localization/language_controller.dart';
import 'package:wasselni/core/routes/app_routes.dart';
import 'package:wasselni/firebase_options.dart';
import 'package:wasselni/l10n/app_localizations.dart';

import 'core/theme/app_colors.dart';
import 'features/splash/presentation/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: WasselniApp()));
}

class WasselniApp extends ConsumerWidget {
  const WasselniApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(languageProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Wasselni',

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: const [Locale('ar'), Locale('en')],

      locale: locale,

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.white,
      ),

      routes: AppRoutes.routes,

      home: const SplashView(),
    );
  }
}
