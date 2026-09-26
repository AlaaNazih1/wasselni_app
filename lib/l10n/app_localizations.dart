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

  /// Order creation success message
  ///
  /// In ar, this message translates to:
  /// **'تم إنشاء الطلب بنجاح'**
  String get orderCreatedSuccessfully;

  /// Pickup address label
  ///
  /// In ar, this message translates to:
  /// **'من (عنوان الاستلام)'**
  String get pickupAddress;

  /// Pickup address example
  ///
  /// In ar, this message translates to:
  /// **'مثال: ديروط'**
  String get pickupExample;

  /// Delivery address label
  ///
  /// In ar, this message translates to:
  /// **'إلى (عنوان التسليم)'**
  String get deliveryAddress;

  /// Delivery address example
  ///
  /// In ar, this message translates to:
  /// **'مثال: أسيوط'**
  String get deliveryExample;

  /// Continue action
  ///
  /// In ar, this message translates to:
  /// **'متابعة'**
  String get continueButton;

  /// Create a new order label
  ///
  /// In ar, this message translates to:
  /// **'إنشاء طلب جديد'**
  String get createNewOrder;

  /// Pickup and delivery option label
  ///
  /// In ar, this message translates to:
  /// **'استلام وتوصيل'**
  String get pickupAndDelivery;

  /// Delivery only option label
  ///
  /// In ar, this message translates to:
  /// **'توصيل فقط'**
  String get deliveryOnly;

  /// Order details section label
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل الطلب'**
  String get orderDetails;

  /// Prompt to enter order details
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل تفاصيل الطلب'**
  String get enterOrderDetails;

  /// Hint for entering order details
  ///
  /// In ar, this message translates to:
  /// **'اكتب تفاصيل الطلب...'**
  String get orderDetailsHint;

  /// Price details section label
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل السعر'**
  String get priceDetails;

  /// Message shown when login is required
  ///
  /// In ar, this message translates to:
  /// **'يجب تسجيل الدخول أولاً'**
  String get loginRequired;

  /// Order confirmation success message
  ///
  /// In ar, this message translates to:
  /// **'تم تأكيد الطلب بنجاح'**
  String get orderConfirmedSuccessfully;

  /// Order creation error message
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ أثناء إنشاء الطلب: {error}'**
  String orderCreationError(String error);

  /// Pickup location label
  ///
  /// In ar, this message translates to:
  /// **'مكان الاستلام'**
  String get pickupLocation;

  /// Delivery location label
  ///
  /// In ar, this message translates to:
  /// **'مكان التوصيل'**
  String get deliveryLocation;

  /// Delivery price label
  ///
  /// In ar, this message translates to:
  /// **'سعر التوصيل'**
  String get deliveryPrice;

  /// Additional fees label
  ///
  /// In ar, this message translates to:
  /// **'رسوم إضافية'**
  String get additionalFees;

  /// Optional fees qualifier
  ///
  /// In ar, this message translates to:
  /// **'(إن وجدت)'**
  String get ifAny;

  /// Total amount label
  ///
  /// In ar, this message translates to:
  /// **'إجمالي المبلغ'**
  String get totalAmount;

  /// Message shown while creating an order
  ///
  /// In ar, this message translates to:
  /// **'جاري إنشاء الطلب...'**
  String get creatingOrder;

  /// Confirm order action
  ///
  /// In ar, this message translates to:
  /// **'تأكيد الطلب'**
  String get confirmOrder;

  /// Prompt preceding a required input
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل'**
  String get pleaseEnter;

  /// Welcome message prefix
  ///
  /// In ar, this message translates to:
  /// **'مرحباً بك في'**
  String get welcomeTo;

  /// Phone number label
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف'**
  String get phoneNumber;

  /// Phone number input prompt
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل رقم الهاتف'**
  String get enterPhoneNumber;

  /// Phone number validation message
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف يجب أن يكون 11 رقم'**
  String get phoneNumberMustBe11Digits;

  /// Password label
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور'**
  String get password;

  /// Password input prompt
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل كلمة المرور'**
  String get enterPassword;

  /// Password validation message
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور يجب أن تكون 6 أحرف على الأقل'**
  String get passwordMustBe6Characters;

  /// Log in action
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login;

  /// Create account action
  ///
  /// In ar, this message translates to:
  /// **'إنشاء حساب جديد'**
  String get createNewAccount;

  /// Create account heading
  ///
  /// In ar, this message translates to:
  /// **'إنشاء حساب'**
  String get createAccount;

  /// Join Wasselni message
  ///
  /// In ar, this message translates to:
  /// **'انضم إلى Wasselni'**
  String get joinWasselni;

  /// Full name label
  ///
  /// In ar, this message translates to:
  /// **'الاسم بالكامل'**
  String get fullName;

  /// Name input hint
  ///
  /// In ar, this message translates to:
  /// **'أدخل اسمك'**
  String get enterYourName;

  /// Name required validation message
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل اسمك'**
  String get pleaseEnterYourName;

  /// Name minimum length validation message
  ///
  /// In ar, this message translates to:
  /// **'الاسم يجب أن يكون 3 أحرف على الأقل'**
  String get nameMinLength;

  /// Phone number required validation message
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل رقم الهاتف'**
  String get pleaseEnterPhone;

  /// Phone number length validation message
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف يجب أن يكون 11 رقم'**
  String get phoneMustBe11;

  /// Invalid phone number validation message
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف غير صحيح'**
  String get invalidPhone;

  /// Email address label
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get email;

  /// Email input hint
  ///
  /// In ar, this message translates to:
  /// **'example@email.com'**
  String get enterEmail;

  /// Email required validation message
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل البريد الإلكتروني'**
  String get pleaseEnterEmail;

  /// Invalid email validation message
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني غير صحيح'**
  String get invalidEmail;

  /// Password required validation message
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل كلمة المرور'**
  String get pleaseEnterPassword;

  /// Password minimum length validation message
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور يجب أن تكون 6 أحرف على الأقل'**
  String get passwordMinLength;

  /// Confirm password label
  ///
  /// In ar, this message translates to:
  /// **'تأكيد كلمة المرور'**
  String get confirmPassword;

  /// Confirm password validation message
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أكد كلمة المرور'**
  String get pleaseConfirmPassword;

  /// Password mismatch validation message
  ///
  /// In ar, this message translates to:
  /// **'كلمتا المرور غير متطابقتين'**
  String get passwordsDoNotMatch;

  /// Register action
  ///
  /// In ar, this message translates to:
  /// **'إنشاء الحساب'**
  String get register;

  /// Existing account login prompt
  ///
  /// In ar, this message translates to:
  /// **'لديك حساب بالفعل؟ تسجيل الدخول'**
  String get alreadyHaveAccount;

  /// Account creation success message
  ///
  /// In ar, this message translates to:
  /// **'تم إنشاء الحساب بنجاح'**
  String get accountCreatedSuccessfully;

  /// Phone number input hint
  ///
  /// In ar, this message translates to:
  /// **'01XXXXXXXXX'**
  String get hintPhoneNumber;
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
