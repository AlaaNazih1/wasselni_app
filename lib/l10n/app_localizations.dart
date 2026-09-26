import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// Home navigation label
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get home;

  /// My orders navigation label
  ///
  /// In ar, this message translates to:
  /// **'طلباتي'**
  String get myOrders;

  /// New order label
  ///
  /// In ar, this message translates to:
  /// **'طلب جديد'**
  String get newOrder;

  /// Profile navigation label
  ///
  /// In ar, this message translates to:
  /// **'حسابي'**
  String get profile;

  /// Language selection prompt
  ///
  /// In ar, this message translates to:
  /// **'اختر اللغة'**
  String get chooseLanguage;

  /// Arabic language name
  ///
  /// In ar, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// English language name
  ///
  /// In ar, this message translates to:
  /// **'English'**
  String get english;

  /// Notifications label
  ///
  /// In ar, this message translates to:
  /// **'الإشعارات'**
  String get notifications;

  /// Track order label
  ///
  /// In ar, this message translates to:
  /// **'تتبع الطلب'**
  String get trackOrder;

  /// Log out action
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج'**
  String get logout;

  /// Cancel action
  ///
  /// In ar, this message translates to:
  /// **'إلغاء'**
  String get cancel;

  /// Confirm action
  ///
  /// In ar, this message translates to:
  /// **'تأكيد'**
  String get confirm;

  /// Profile data loading error
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ في تحميل البيانات'**
  String get profileLoadError;

  /// Message shown when user data is unavailable
  ///
  /// In ar, this message translates to:
  /// **'لا توجد بيانات للمستخدم'**
  String get noUserData;

  /// Message shown when there are no orders
  ///
  /// In ar, this message translates to:
  /// **'لا توجد طلبات حتى الآن'**
  String get noOrdersYet;

  /// Delivered order status
  ///
  /// In ar, this message translates to:
  /// **'تم التسليم'**
  String get delivered;

  /// Order is on the way status
  ///
  /// In ar, this message translates to:
  /// **'في الطريق'**
  String get onTheWay;

  /// Cancelled order status
  ///
  /// In ar, this message translates to:
  /// **'ملغي'**
  String get cancelled;

  /// Order received status
  ///
  /// In ar, this message translates to:
  /// **'تم استلام الطلب'**
  String get orderReceived;

  /// Currency name
  ///
  /// In ar, this message translates to:
  /// **'جنيه'**
  String get currency;

  /// Menu label
  ///
  /// In ar, this message translates to:
  /// **'القائمة'**
  String get menu;

  /// Welcome message
  ///
  /// In ar, this message translates to:
  /// **'أهلاً بك'**
  String get welcome;

  /// Prompt encouraging users to order what they need
  ///
  /// In ar, this message translates to:
  /// **'اطلب اللي محتاجه بسهولة'**
  String get orderWhatYouNeed;

  /// Orders category label
  ///
  /// In ar, this message translates to:
  /// **'طلبات'**
  String get orders;

  /// Restaurants category label
  ///
  /// In ar, this message translates to:
  /// **'مطاعم'**
  String get restaurants;

  /// Pharmacies category label
  ///
  /// In ar, this message translates to:
  /// **'صيدليات'**
  String get pharmacies;

  /// Stores category label
  ///
  /// In ar, this message translates to:
  /// **'متاجر'**
  String get stores;

  /// Always ahead message
  ///
  /// In ar, this message translates to:
  /// **'مع وصلني دائماً'**
  String get alwaysAhead;

  /// One step ahead message
  ///
  /// In ar, this message translates to:
  /// **'سابقين بخطوة'**
  String get oneStepAhead;

  /// Latest orders label
  ///
  /// In ar, this message translates to:
  /// **'آخر الطلبات'**
  String get latestOrders;

  /// View all orders label
  ///
  /// In ar, this message translates to:
  /// **'عرض الكل'**
  String get viewAll;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
