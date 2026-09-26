import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final languageProvider = NotifierProvider<LanguageController, Locale>(
  LanguageController.new,
);

class LanguageController extends Notifier<Locale> {
  static const String _languageKey = 'language';

  @override
  Locale build() {
    _loadLanguage();
    return const Locale('ar');
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();

    final savedLanguage = prefs.getString(_languageKey);

    if (savedLanguage != null) {
      state = Locale(savedLanguage);
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    state = Locale(languageCode);

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_languageKey, languageCode);
  }
}
